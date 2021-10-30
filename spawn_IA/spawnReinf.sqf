/* Troupes russes en renfort avec une fonction random */

//Définition de paramètres généraux du script
private _ALTITUDE_PARADROP = 300; //Altitude à laquelle seront dropés les paras
private _DISTANCE_PARADROP = -400; //Distance du paradrop par rapport au plus proche joueur. Un chiffre négatif implique une dz derrière le plus proche joueur
private _PROBA_NO_REINF = 0.33; // Probabilité de non envoi des renforts si l'HVT a été tué

//Définition des groupes de para
private _fsl_ENI_1    = "rhs_vdv_flora_rifleman";
private _lat_ENI_1    = "rhs_vdv_flora_lat";
private _aa_ENI_1     = "rhs_vdv_flora_aa";
private _at_ENI_1     = "rhs_vdv_flora_at";
private _ass_at_ENI_1 = "rhs_vdv_flora_strelok_rpg_assist";
private _lmg_ENI_1    = "rhs_vdv_flora_junior_sergeant";
private _mg_ENI_1     = "rhs_vdv_flora_machinegunner";
private _ass_mg_ENI_1 = "rhs_vdv_flora_machinegunner_assistant";
private _gl_ENI_1     = "rhs_vdv_flora_grenadier";
private _tl_ENI_1     = "rhs_vdv_flora_sergeant";
private _sl_ENI_1     = "rhs_vdv_flora_officer_armored";
private _medic_ENI_1  = "rhs_vdv_flora_medic";


private _tbMrkSpawnMeca = allMapMarkers select {["mrkSpawn_meca_", _x, true] call BIS_fnc_inString};
private _nbMrk = count _tbMrkSpawnMeca;
private _posSpawn = "";
private _nearestDistance = 1000000;
private _nearestPlayer = "";
private _mrkSpawn = "";
private _isFirst = true;					//La première vague de renfort arrive après environ 45 minutes

//Groupe de 6 PAX
GRP_PARA_PETIT = [_tl_ENI_1, _at_ENI_1, _ass_at_ENI_1, _tl_ENI_1, _mg_ENI_1, _ass_mg_ENI_1];

//Groupe de 12 PAX, emport maximal du mi-8
GRP_PARA_GRAND = [_sl_ENI_1, _medic_ENI_1, _tl_ENI_1, _at_ENI_1, _ass_at_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _tl_ENI_1, _mg_ENI_1, _ass_mg_ENI_1, _fsl_ENI_1, _fsl_ENI_1];

//Groupe de 6 PAX
GRP_MECA_PETIT = [_tl_ENI_1, _at_ENI_1, _ass_at_ENI_1, _tl_ENI_1, _mg_ENI_1, _ass_mg_ENI_1];

//Groupe de 12 PAX, emport maximal du mi-8
GRP_MECA_GRAND = [_sl_ENI_1, _tl_ENI_1, _at_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _tl_ENI_1, _mg_ENI_1, _fsl_ENI_1];

// Waiting for player detection (managed by a trigger)
while {!isPlayerDetected} do {
	sleep 60;
};

systemChat "Le script de renfort para est déclenché.";

while {true} do {

	//Si le HVT est tué, il y a 1/_PROBA_NO_REINF chance pour que certains  renforts ne soient pas appelés
	private _goReinf = true;
	if (isHVTKilled && (random 1 < _PROBA_NO_REINF)) then {
		_goReinf = false;
		systemChat "L'appel des renforts a échoué (HVT tué)";
	};

	//Vérifie si les joueurs sont toujours repérés par les ENI
	private _isPlayerKnownByENI = false;
	if (count ([opfor] call int_fnc_sideGroupsKnowPlayer) > 0) then {_isPlayerKnownByENI = true};
	
	if (_goReinf) then {

		if (_isFirst) then {
			//Première vague de paradrop : arrivent environ 45 minutes après le début de partie
			//sleep 10;
			sleep 2700;
			_isFirst = false;
		} else {
			//Vagues suivantes : arrivent toutes les 20 à 30 minutes
			//sleep 20;
			sleep 1200 + random 600;
		};

		//Récupère le nombre de joueurs vivants pour ajustement du nombre de troupes en renfort
		private _allPlayers = playableUnits + (switchableUnits select {_x != HC_Slot});
		private _nbAlivePlayers = count _allPlayers;

		/*********************/
		/* Renforts paradrop */
		/*********************/

		//Détermine la position de paradrop du ou des groupes en attaque directe : drop à 300 m. du joueur le plus proche 
		private _tbPosParaAttack = [getMarkerPos "mrkSpawnParadrop", nil, _DISTANCE_PARADROP] call int_fnc_findUnloadPos;
		private _posParaAttack = _tbPosParaAttack#0;
		private _posNearestPlayer = _tbPosParaAttack#1; 

		//Détermine la position de la ou des garnisons à renforcer, la plus proche d'un des joueurs
		private _prefixMarkerGarn = "marker_garn_";
		private _prefixMarkerZone = "mrkZn";
		private _tbMrkGarn = allMapMarkers select {[_prefixMarkerGarn, _x, true] call BIS_fnc_inString};
		private _markerReinf =  [_tbMrkGarn, _posNearestPlayer] call BIS_fnc_nearestPosition;
		private _posReinf = getMarkerPos _markerReinf;
		private _znPatrol = [_markerReinf, count _prefixMarkerGarn] call BIS_fnc_trimString;
		private _markerZnPatrol = _prefixMarkerZone + _znPatrol;

		//Appel du script de paradrop Lucy
		private _paradrop = {

			params [
					"_posParadrop",
					"_grpPara",
					["_typeReinf", "REINF"],
					["_znPatrol", ""],
					["_altitude", 100]
			];
			
			private _group = [
				getMarkerPos "mrkSpawnParadrop",
				_posParadrop,
				getMarkerPos "mrkSpawnParadrop",
				opfor,
				["RHS_Mi8mt_Cargo_vv","rhs_pilot_transport_heli", _altitude],
				_grpPara,
				"FULL"
			]  call GDC_fnc_lucySpawnGroupInfParadrop;
			
			if (_typeReinf == "REINF") then {
				[(_group#0),_znPatrol,["MOVE","LIMITED","AWARE","YELLOW","COLUMN"]] call GDC_fnc_lucyGroupRandomPatrol; 
			} else {
				(_group#0) setVariable ["PLUTO_ORDER","QRF"];
			};

			_group;
			
		};

		switch true do {
			case (_nbAlivePlayers < 11): {
				//Un groupe en attaque directe si les joueurs sont repérés
				if (_isPlayerKnownByENI)  then {private _group = [_posParaAttack, GRP_PARA_PETIT, "QRF", _ALTITUDE_PARADROP] call _paradrop};
				sleep 60;
				//1 groupe en renfort de la garnison la plus proche
				_group = [_posReinf, GRP_PARA_PETIT, "REINF", _markerZnPatrol, _ALTITUDE_PARADROP] call _paradrop;
			};
			case (_nbAlivePlayers > 10 && _nbAlivePlayers < 21): {
				//Un groupe en attaque directe, 2 groupes en renfort de garnisons
				if (_isPlayerKnownByENI)  then {_group = [_posParaAttack, GRP_PARA_GRAND, "QRF"] call _paradrop};
				sleep 60;
				//2 groupes en renfort de la garnison la plus proche
				_group = [_posReinf, GRP_PARA_PETIT, "REINF", _markerZnPatrol, _ALTITUDE_PARADROP] call _paradrop;
				sleep 30;
				_group = [_posReinf, GRP_PARA_GRAND, "REINF", _markerZnPatrol, _ALTITUDE_PARADROP] call _paradrop;
			};
			case (_nbAlivePlayers > 20): {
				//Deux groupes en attaque directe, 2 groupes en renfort de garnisons
				if (_isPlayerKnownByENI)  then {_group = [_posParaAttack, GRP_PARA_GRAND, "QRF", _ALTITUDE_PARADROP] call _paradrop};
				sleep 5;
				//sleep 120;
				if (_isPlayerKnownByENI)  then {_group = [_posParaAttack, GRP_PARA_GRAND, "QRF", _ALTITUDE_PARADROP] call _paradrop};
				sleep 5;
				//sleep 120;
				_group = [_posReinf, GRP_PARA_PETIT, "REINF", _markerZnPatrol, _ALTITUDE_PARADROP] call _paradrop;
				sleep 5;
				//sleep 60;
				_group = [_posReinf, GRP_PARA_GRAND, "REINF", _markerZnPatrol, _ALTITUDE_PARADROP] call _paradrop;

			};
		};

		/*********************/
		/* Renforts mécas */
		/*********************/

		if (_isPlayerKnownByENI) then {

			systemChat "Un méca va être envoyé en renfort.";

			//Choisit un point de spawn en s'assurant qu'il n'est pas trop près des joueurs
			for [{ _i = 0 }, {_i < _nbMrk}, { _i = _i + 1 }] do {
				_nearestDistance = 1000000;
				_posSpawn = getMarkerPos (_tbMrkSpawnMeca#_i);
				_mrkSpawn = (_tbMrkSpawnMeca#_i);
				{
					_currentDistance = _x distance2D _posSpawn;
					if (_currentDistance < _nearestDistance) then {
						_nearestPlayer = _x;
						_nearestDistance = _currentDistance;
					};
				} forEach _allPlayers;

				if (_nearestDistance > 1000 && _nearestDistance < 2000) exitWith {};
			};

			//On trouve le point d'unload pour le méca : à 500 m. du joueur le plus proche
			private _tbPosUnload = [_posSpawn] call int_fnc_findUnloadPos;
			_mrkUnload = _tbPosUnload#2;
			_mrkSAD = createMarkerLocal ["mrk" + str floor (random 10000), _tbPosUnload#1];
			_mrkSAD setMarkerTypeLocal "hd_destroy";
			
			//Et on envoie la cavalerie
			switch true do {
				case (_nbAlivePlayers < 11): {
					[[_mrkSpawn, _mrkUnload, _mrkSAD], opfor, GRP_MECA_PETIT] spawn int_fnc_spawnMechInfantry;
				};
				case (_nbAlivePlayers > 10 && _nbAlivePlayers < 21): {
					[[_mrkSpawn, _mrkUnload, _mrkSAD], opfor, GRP_MECA_GRAND] spawn int_fnc_spawnMechInfantry;
				};
				case (_nbAlivePlayers > 20): {
					[[_mrkSpawn, _mrkUnload, _mrkSAD], opfor, GRP_MECA_GRAND] spawn int_fnc_spawnMechInfantry;
					sleep 60;
					[[_mrkSpawn, _mrkUnload, _mrkSAD], opfor, GRP_MECA_GRAND] spawn int_fnc_spawnMechInfantry;
				};
			};
		}
	};

	sleep 60;

};
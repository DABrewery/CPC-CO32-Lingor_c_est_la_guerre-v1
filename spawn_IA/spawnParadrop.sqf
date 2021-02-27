/* Paradrope des troupes russes en renfort avec une fonction random sur déclenchement de l'event handler scripté "goParadrop" */

//Définition des groupes
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

//Groupe de 6 PAX
GRP_PARA_PETIT = [_tl_ENI_1, _at_ENI_1, _ass_at_ENI_1, _tl_ENI_1, _mg_ENI_1, _ass_mg_ENI_1];

//Groupe de 12 PAX, emport maximal du mi-8
GRP_PARA_GRAND = [_sl_ENI_1, _medic_ENI_1, _tl_ENI_1, _at_ENI_1, _ass_at_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _tl_ENI_1, _mg_ENI_1, _ass_mg_ENI_1, _fsl_ENI_1, _fsl_ENI_1];

private _isFirst = true;

while {true} do {

	if (_isFirst) then {
		//Première vague de paradrop : arrivent environ 45 minutes après le début de partie
		sleep 2700;
		_isFirst = false;
	} else {
		//Vagues suivantes : arrivent toutes les 20 à 30 minutes
		sleep 1200 + random 600;
	};

	//Récupère le nombre de joueurs vivants pour ajustement du nombre de troupes en renfort
	private _allPlayers = (playableUnits select {_x != HC_Slot}) + (switchableUnits select {_x != HC_Slot});
	private _nbAlivePlayers = count _allPlayers;
	systemChat str _nbAlivePlayers;

	//Détermine la position de paradrop du ou des groupes en attaque directe, à savoir dans un rayon proche d'un des joueurs
	private _pos = position (selectRandom _allPlayers);
	private _posParaAttack = [[[_pos, 300]], ["water"]] call BIS_fnc_randomPos;

	//Détermine la position de la ou des garnisons à renforcer, la plus proche d'un des joueurs
	private _prefixMarkerGarn = "marker_garn_";
	private _prefixMarkerZone = "mrkZn";
	private _tbMrkGarn = allMapMarkers select {[_prefixMarkerGarn, _x, true] call BIS_fnc_inString};
	private _markerReinf =  [_tbMrkGarn, _pos] call BIS_fnc_nearestPosition;
	private _posReinf = getMarkerPos _markerReinf;
	private _znPatrol = [_markerReinf, count _prefixMarkerGarn] call BIS_fnc_trimString;
	private _markerZnPatrol = _prefixMarkerZone + _znPatrol;

	//Appel du script de paradrop Lucy
	private _paradrop = {

		params [
				"_posParadrop",
				"_grpPara",
				["_typeReinf", "REINF"],
				["_znPatrol", ""]
		];
		
		private _group = [
			getMarkerPos "mrkSpawnParadrop",
			_posParadrop,
			getMarkerPos "mrkSpawnParadrop",
			opfor,
			["RHS_Mi8mt_Cargo_vv","rhs_pilot_transport_heli",100],
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
			//Un groupe en attaque directe
			private _group = [_posParaAttack, GRP_PARA_PETIT, "QRF"] call _paradrop;
			sleep 5;
			//1 groupe en renfort de la garnison la plus proche
			_group = [_posReinf, GRP_PARA_PETIT, "REINF", _markerZnPatrol] call _paradrop;
		};
		case (_nbAlivePlayers > 10 && _nbAlivePlayers < 21): {
			//Un groupe en attaque directe, 2 groupes en renfort de garnisons
			_group = [_posParaAttack, GRP_PARA_GRAND, "QRF"] call _paradrop;
			sleep 5;
			//2 groupes en renfort de la garnison la plus proche
			_group = [_posReinf, GRP_PARA_PETIT, "REINF", _markerZnPatrol] call _paradrop;
			sleep 5;
			_group = [_posReinf, GRP_PARA_GRAND, "REINF", _markerZnPatrol] call _paradrop;
		};
		case (_nbAlivePlayers > 20): {
			//Deux groupes en attaque directe, 2 groupes en renfort de garnisons
			_group = [_posParaAttack, GRP_PARA_GRAND, "QRF"] call _paradrop;
			sleep 5;
			_group = [_posParaAttack, GRP_PARA_GRAND, "QRF"] call _paradrop;
			sleep 5;
			_group = [_posReinf, GRP_PARA_PETIT, "REINF", _markerZnPatrol] call _paradrop;
			sleep 5;
			_group = [_posReinf, GRP_PARA_GRAND, "REINF", _markerZnPatrol] call _paradrop;

		};
	};
};
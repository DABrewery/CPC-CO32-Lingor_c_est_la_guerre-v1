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
GRP_MECA_PETIT = [_tl_ENI_1, _at_ENI_1, _ass_at_ENI_1, _tl_ENI_1, _mg_ENI_1, _ass_mg_ENI_1];

//Groupe de 12 PAX, emport maximal du mi-8
GRP_MECA_GRAND = [_sl_ENI_1, _tl_ENI_1, _at_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _tl_ENI_1, _mg_ENI_1, _fsl_ENI_1];

//Récupère le nombre de joueurs vivants pour ajustement du nombre de troupes en renfort

private _tbMrkSpawnMeca = allMapMarkers select {["mrkSpawn_meca_", _x, true] call BIS_fnc_inString};
private _nbMrk = count _tbMrkSpawnMeca;
private _posSpawn = "";
private _nearestDistance = 1000000;
private _nearestPlayer = "";
private _mrkSpawn = "";
private _isFirst = true;

while {true} do {

	private _allPlayers = (playableUnits select {_x != HC_Slot}) + (switchableUnits select {_x != HC_Slot});
	private _nbAlivePlayers = count _allPlayers;

	if (_isFirst) then {
		//Première vague : arrivent environ 45 minutes après le début de partie
		//sleep 10;
		sleep 2700;
		_isFirst = false;
	} else {
		//Vagues suivantes : arrivent toutes les 20 à 30 minutes
		//sleep 60;
		sleep 1200 + random 600;
	};

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
	_posUnload =  [_posSpawn, _nearestDistance - 500, (position _nearestPlayer getdir _posSpawn) - 180] call BIS_fnc_relPos;
	_mrkUnload = createMarkerLocal ["mrk" + str (random 1000), _posUnload];
	_mrkUnload setMarkerTypeLocal "hd_dot";
	_mrkSAD = createMarkerLocal ["mrk" + str (random 1000), position _nearestPlayer];
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

};


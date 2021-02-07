//Le nom de la zone qui sera utilisé pour tous les spawns 
private _zn = "Research101";
private _grpGarn = objNull;
private _nbPat = objNull;
private _probaManedFW = objNull;

switch true do {
		case (nbJoueurs < 11): {
			//
			_grpGarn = GROUPE_ENI_1_PETIT;
			//
			_nbPat = [1,2];
			// 
			_probaManedFW = 0.5;
		};
		case (nbJoueurs > 10 && nbJoueurs < 17): {
			//
			_grpGarn = GROUPE_ENI_1_PETIT;
			//
			_nbPat = [2,3];
			// 
			_probaManedFW = 0.6;
		};
		case (nbJoueurs > 16 && nbJoueurs < 24): {
			//
			_grpGarn = GROUPE_ENI_1_MOYEN;
			//
			_nbPat = [3,4];
			// 
			_probaManedFW = 1;
		};
		case (nbJoueurs > 23): {
			//
			_grpGarn = GROUPE_ENI_1_GRAND;
			//
			_nbPat = [3,4];
			// 
			_probaManedFW = 1;
		}; 
};

//Spawn des patrouilles
[_zn, _nbPat, GROUPE_ENI_1_PETIT, opfor] spawn int_fnc_spawnRdmPatrols;

//Spawn des garnisons
[_zn, _grpGarn, opfor, nil, nil, 0.1, 1] spawn int_fnc_spawnGarnisons;

//Spawn des armes fixes
[_zn, opfor, "rhs_KORD_high_VMF", "rhs_vmf_flora_rifleman", nil, _probaManedFW, 0.8] spawn int_fnc_spawnFixedWeapons;
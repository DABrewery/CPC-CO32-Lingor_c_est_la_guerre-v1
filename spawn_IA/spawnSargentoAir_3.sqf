//Le nom de la zone qui sera utilisé pour tous les spawns 
private _zn = "SargentoAir_3";
private _grpGarn = objNull;
private _nbPat = objNull;
private _probaManedFW = objNull;

switch true do {
		case (nbJoueurs < 16): {
			//Entre 8 et 16 pax en garnison
			_grpGarn = GROUPE_OPFOR_PETIT;
			//Entre 6 et 16 pax en patrouille
			_nbPat = [1,2];
			//Proba arme fixe occupée au départ 
			_probaManedFW = 0.6;
		};
		case (nbJoueurs > 17 && nbJoueurs < 20): {
			//Entre 20 et 28 pax en garnison
			_grpGarn = GROUPE_OPFOR_MOYEN;
			//Entre 8 et 20 pax en patrouille
			_nbPat = [2,3];
			//Proba arme fixe occupée au départ 
			_probaManedFW = 0.8;
		};
		case (nbJoueurs > 19): {
			//Entre 32 et 40 pax en garnison
			_grpGarn = GROUPE_OPFOR_GRAND;
			//Entre 10 et 24 pax en patrouille
			_nbPat = [3,4];
			//Proba arme fixe occupée au départ 
			_probaManedFW = 1;
		}; 
};

//Spawn des patrouilles
[_zn,_nbPat,GROUPE_OPFOR_PETIT,opfor] spawn int_fnc_spawnRdmPatrols;

//Spawn des garnisons
//[_zn, _grpGarn, opfor, nil, nil, 0.1, 1] spawn int_fnc_spawnGarnisons;

//Spawn des armes fixes
//[_zn, opfor, "rhs_KORD_high_VMF", "rhs_vmf_flora_rifleman", 1, _probaManedFW, 0.8] spawn int_fnc_spawnFixedWeapons;
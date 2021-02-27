//Spawn des patrouilles
["Prison1", [1], GROUPE_ENI_2_PETIT, opfor] spawn int_fnc_spawnRdmPatrols;
["Prison2", [1], GROUPE_ENI_2_PETIT, opfor] spawn int_fnc_spawnRdmPatrols;
["Prison3", [1], GROUPE_ENI_2_PETIT, opfor] spawn int_fnc_spawnRdmPatrols;
["Prison4", [1], GROUPE_ENI_2_PETIT, opfor] spawn int_fnc_spawnRdmPatrols;
["Prison4", GROUPE_ENI_2_PETIT, opfor, nil, nil, 0.1, 1] spawn int_fnc_spawnGarnisons;
["Prison5", [1], GROUPE_ENI_2_PETIT, opfor] spawn int_fnc_spawnRdmPatrols;
["Prison", opfor, "rhsgref_tla_DSHKM", "rhsgref_tla_rifleman_pm63", 1, 0.33, 1] spawn int_fnc_spawnFixedWeapons;
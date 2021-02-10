//Spawn des patrouilles
["Prison1", [1], GROUPE_ENI_2_PETIT, opfor] spawn int_fnc_spawnRdmPatrols;
["Prison2", [1], GROUPE_ENI_2_PETIT, opfor] spawn int_fnc_spawnRdmPatrols;
["Prison3", [1], GROUPE_ENI_2_PETIT, opfor] spawn int_fnc_spawnRdmPatrols;
["Prison4", [1], GROUPE_ENI_2_PETIT, opfor] spawn int_fnc_spawnRdmPatrols;
["Prison4", GROUPE_ENI_2_PETIT, opfor, nil, nil, 0.1, 1] spawn int_fnc_spawnGarnisons;
["Prison5", [1], GROUPE_ENI_2_PETIT, opfor] spawn int_fnc_spawnRdmPatrols;
["Prison", opfor, "rhsgref_tla_DSHKM", "rhsgref_tla_rifleman_pm63", 1, 0.33, 1] spawn int_fnc_spawnFixedWeapons;

//Interactions pour fuite des prisonniers
_action = [ 
 "Flee", 
 "Autoriser à prendre la fuite", 
 "", 
 { 
  private _wp = grp_prisonners_1 addWaypoint [getMarkerPos "mrkFuitePrisonners",0]; 
  _wp setWaypointType "MOVE"; 
  (leader grp_prisonners_1) enableAI "PATH";
  isPrisonLib = true;
  publicVariableServer "isPrisonLib";
 }, 
 {captive (leader grp_prisonners_1) == false} 
] call ace_interact_menu_fnc_createAction;

[
 leader grp_prisonners_1, 
 0, 
 ["ACE_MainActions"], 
 _action 
] call ace_interact_menu_fnc_addActionToObject;

_action = [ 
 "Flee", 
 "Autoriser à prendre la fuite", 
 "", 
 { 
  private _wp = grp_prisonners_2 addWaypoint [getMarkerPos "mrkFuitePrisonners",0]; 
  _wp setWaypointType "MOVE"; 
  (leader grp_prisonners_2) enableAI "PATH";
  isPrisonLib = true;
  publicVariableServer "isPrisonLib";
 }, 
 {captive (leader grp_prisonners_2) == false} 
] call ace_interact_menu_fnc_createAction;

[
 leader grp_prisonners_2, 
 0, 
 ["ACE_MainActions"], 
 _action 
] call ace_interact_menu_fnc_addActionToObject;
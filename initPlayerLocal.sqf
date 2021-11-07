//For JIP players : directly teleported to the safety zone
if (_this select 1) then {
	player setPos getMarkerPos "respawn";
};

/* ACE Actions def */
	
	//Self action to launch regroup. Player must possess the "magic" item  
	_actionRegroup = [ 
		"Respawn", 
		"Battre le rappel", 
		"", 
		{ 
			dispoRsp = false;
			publicVariable "dispoRsp";
			[] spawn int_fnc_customRegroup;
			[time + otherRgpDelay] spawn int_fnc_respawnTimer;
		}, 
		{
			//Check conditions to allow respawn
			//int_fnc_isInLoadout is a very simple function to ckeck the presence of an object in unit inventory 
			(dispoRsp && [player, "ACE_Cellphone"] call int_fnc_isInLoadout) && (count ((units opSide) inAreaArray [getPosWorld Player, 300, 300]) == 0);
		} 
	] call ace_interact_menu_fnc_createAction;
	[player,1,["ACE_SelfActions"],_actionRegroup] call ace_interact_menu_fnc_addActionToObject;

	//Self action to show the regroup/respawn HUD
	isReinfHUDVisible = false;
	_actionShowReinfHUD = [
		"showReinfHUD", 
		"Afficher l'indicateur de renforts", 
		"",
		{ 
			cutRsc ["RscReinfHUD", "PLAIN"];
			isReinfHUDVisible = true;
			[] spawn {
				
				while {isReinfHUDVisible} do {
					//systemChat str (missionNameSpace getVariable "delayBeforeRegroup");
					private _delay = floor ((missionNameSpace getVariable "delayBeforeRegroup") /60);
					private _playersInSafetyZone = str(count ((playableUnits + (switchableUnits select {_x != HC_Slot})) inAreaArray trg_SafetyZone));
					private _isReinfDispo = missionNamespace getVariable "dispoRsp";
					private _strCtrl = "";
					private _nightTimeHours = [18.65, 5.50];
					switch true do {
						case (_delay < 1 && !_isReinfDispo): {_strCtrl = "Dispo des renforts imminente"};
						case (_delay < 1 && _isReinfDispo): {
							_strCtrl = "Renforts disponibles !";
							uiNamespace getVariable "ReinfHUD" displayCtrl 100 ctrlSetTextColor [255, 0, 0, 1];
						};
						default {
							_strCtrl = "Renforts dispos dans " + str(_delay) + " min";
							if ((daytime > (_nightTimeHours#0)) || (daytime > 0 && daytime < (_nightTimeHours#1))) then {
								uiNamespace getVariable "ReinfHUD" displayCtrl 100 ctrlSetTextColor [255, 255, 255, 1];
							} else {
								uiNamespace getVariable "ReinfHUD" displayCtrl 100 ctrlSetTextColor [0, 0, 0, 1];
							};
						};
					};
					uiNamespace getVariable "ReinfHUD" displayCtrl 100 ctrlSetText _strCtrl + "\nPax en attente : " + _playersInSafetyZone;
					sleep 15;
				}
			};
		},
		{!isReinfHUDVisible && ("firstRegroupeDelay" call BIS_fnc_getParamValue > 0)}
	] call ace_interact_menu_fnc_createAction;
	[player,1,["ACE_SelfActions"],_actionShowReinfHUD] call ace_interact_menu_fnc_addActionToObject;

	//Self action to hide the regroup/respawn HUD
	isReinfHUDVisible = false;
	_actionHideReinfHUD = [
		"hideReinfHUD", 
		"Masquer l'indicateur de renforts", 
		"",
		{ 
			//uiNamespace getVariable "RscReinfHUD";
			uiNamespace getVariable "ReinfHUD" closeDisplay 1;
			isReinfHUDVisible = false;
		},
		{isReinfHUDVisible}
	] call ace_interact_menu_fnc_createAction;
	[player,1,["ACE_SelfActions"],_actionHideReinfHUD] call ace_interact_menu_fnc_addActionToObject;

/* ACE Actions def */
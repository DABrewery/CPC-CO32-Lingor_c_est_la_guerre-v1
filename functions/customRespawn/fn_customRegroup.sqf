/* Custom "respawn", truly a simple TP of all previously respawned players on leader position */

//unhide hostile units (were hidden with custom spectator mode fn_customSpectate.sqf)
{_x hideObject false;} count units opSide;

//On désactive le mode spectateur ACRE et BI pour tout le monde
[false] remoteExec ["acre_api_fnc_setSpectator"];
["Terminate"] remoteExec ["BIS_fnc_EGSpectator"];

//Affiche un message pour prévenir les joueurs que le regroupement va avoir lieu
["Le leader a appelé au regroupement. Celui aura lieu dans moins de 10 secondes, tenez-vous prêts."] remoteExec ["hint"];
sleep 10;

//Determine the regroup position : near the leader
private _leaderPos = position player;
{
	_rspPos =  [_leaderPos, 2, 10, 2, nil, nil, nil, nil, _leaderPos] call BIS_fnc_findSafePos;
	_x setPos _rspPos;

} forEach ((playableUnits select {_x inArea trg_SafetyZone}) + (switchableUnits select {_x != HC_Slot && _x inArea trg_SafetyZone}));


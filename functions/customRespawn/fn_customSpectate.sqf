//Enter spectator mode : client execution only

/* ACE spectator version */
//[true, false, false] call ace_spectator_fnc_setSpectator;
//[playableUnits + switchableUnits] call ace_spectator_fnc_updateUnits;
//private _tbWhiteLstOpfor = [];

/* BI spectator version */
["Initialize", [player, [], true, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;

sleep 5;

DS_egKeyDown = (findDisplay 60492) displayAddEventHandler [
	"KeyDown",
	{
	private _handled = false;
	switch (_this select 1) do {
		case 68: {
			(findDisplay 60492) displayRemoveEventHandler ["KeyDown", DS_egKeyDown];
			["Terminate"] call BIS_fnc_EGSpectator;
			_handled = true;
		};
	};
	_handled
}];

while {player inArea trg_SafetyZone} do {
	{hideObject _x; hideObject (vehicle _x)} count units opSide; //opSide variabale initialized in init.sqf
	{
		_alivePlayer = _x;
		{
			_x hideObject false;
			(vehicle _x) hideObject false;
			//_tbWhiteLstOpfor pushBack _x;
		} forEach ((units opSide) inAreaArray [getPosWorld _alivePlayer, 200, 200]);

	} forEach (playableUnits + (switchableUnits select {_x != HC_Slot}));
//	_tbWhite = playableUnits + switchableUnits + _tbWhiteLstOpfor;
//	[_tbWhite] call ace_spectator_fnc_updateUnits;
	sleep 10;
};
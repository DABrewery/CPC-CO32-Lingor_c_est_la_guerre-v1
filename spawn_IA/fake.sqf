isPlayerKnownByENI = false; 

 private _allPlayers = playableUnits + (switchableUnits select {_x != HC_Slot});
{  
	_player = _x;
	{
		_knows = _x knowsAbout _player;
		if (_knows > 0) exitWith {
			systemChat format ["Le groupe %1 a connaissance du joueur %2 : %3", _x, _player, _knows];
		};
	} forEach allgroups select {side _x == opfor};
  
 } forEach _allPlayers;
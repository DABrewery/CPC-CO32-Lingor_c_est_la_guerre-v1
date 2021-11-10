/*
	Author: [GIE] Gavin "Morbakos" Sertix
	
	Description:
		Supprime les waypoints d'un groupe si il y en a plus que 12
	
	Parameter(s):
		Nothing 

	Returns:
		Nothing
*/

[] spawn {
	private _sleepDelay = 10; // Run it every 5 mins

	while {true} do {
		
		{
			private _currentGroup = _x;
			private _waypoints = waypoints _currentGroup;
			_waypoints sort true;
			private _waypointsCount = count _waypoints;

			if (_waypointsCount > 12) then {
				reverse _waypoints;
				for "_i" from _waypointsCount to 11 step -1 do { // minus 11 to have 12 waypoints left
					systemChat format ["deleting wp %1", _i];
					deleteWaypoint [_currentGroup, _i];
				}
			};

		} forEach allGroups select {!isPlayer(leader _x)};

		sleep _sleepDelay;
	};
}
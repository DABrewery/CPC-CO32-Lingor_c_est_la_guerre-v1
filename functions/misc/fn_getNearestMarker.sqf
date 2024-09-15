/*
	Author: [GIE] Gavin "Morbakos" Sertix
	
	Description:
		Retourne le marker le plus proche d'une position
	
	Parameter(s):
		Nothing
	
	Returns:
		Marker
*/

params [
	["_position", [0,0,0], [[]]]
];

if (_position isEqualTo [0,0,0]) exitWith {
	hint "Position is needed for marker";
};

private _tbMrk = allMapMarkers select {["marker_objective", _x, true] call BIS_fnc_inString};
private _nearestMarker = _tbMrk select 0;
{
	private _curMarker = _x;
	if (((getMarkerPos _curMarker) distance2D _position) < ((getMarkerPos _nearestMarker) distance2D _position)) then {
		_nearestMarker = _curMarker;
	};
} forEach _tbMrk;

_nearestMarker;
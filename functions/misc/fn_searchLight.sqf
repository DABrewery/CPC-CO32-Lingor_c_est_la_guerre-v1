/*

Description :
Order a unit to use a search light to scan a zone until enemy detection

Parameters
0 : OBJECT - the unit (IA) that will use the search light
1 : ARRAY of strings - the names of the markers to which the search light will be directed (randomized)

Example :
[this, ["mrk_watch2_1","mrk_watch2_2","mrk_watch2_3","mrk_watch2_4","mrk_watch2_5","mrk_watch2_6","mrk_watch2_7"]] spawn int_fnc_searchLight;

Returns :
Nothing

*/

params ["_watcher","_tbWatchMrk"];

if !(isServer) exitWith {};
_watcher action ["SearchlightOn", vehicle _watcher];
private _isNearbyENI = objNull;  
while {alive _watcher && (isNull _isNearbyENI)} do {  
	_isNearbyENI = _watcher findNearestEnemy position _watcher;  
	private _watchMrk = selectRandom _tbWatchMrk;
	_watcher doWatch getMarkerPos _watchMrk;  
	sleep 10 + (random 20);  
};

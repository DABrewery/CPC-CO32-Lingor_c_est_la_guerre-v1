/*
	Author: [GIE] Gavin "Morbakos" Sertix
	
	Description:
		Retourne toutes les villes et villages de la map
	
	Parameter(s):
		Nothing
	
	Returns:
		ARRAY of LOCATIONS
*/

private _allowedLocationsTypeArray = ["Name", "NameCity", "NameCityCapital", "NameLocal", "NameVillage"];
private _blacklistedLocationsArray = ["Fantasmo", "Prison"]; // Locations à exclure systématiquement
private _locationsArray = [];
private _mapCenter = [worldSize / 2, worldSize / 2];

{
	private _curLocation = _x;
	private _nearestMarker = [(getPos _curLocation)] call int_fnc_getNearestMarker;
	private _locationSize = [
		getNumber(configfile >> "CfgWorlds" >> worldName >> "Names" >> text _curLocation >> "radiusA"),
		getNumber(configfile >> "CfgWorlds" >> worldName >> "Names" >> text _curLocation >> "radiusB")
	];

	if (!((text _curLocation) in _blacklistedLocationsArray) && ((getPos _curLocation) distance2D (getMarkerPos _nearestMarker)) < 2000) then {
		_locationsArray pushBack _x;
	};

} forEach nearestLocations [_mapCenter, _allowedLocationsTypeArray, 30000];

_locationsArray;
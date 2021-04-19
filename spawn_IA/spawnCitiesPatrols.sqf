/*
	Author: [GIE] Gavin "Morbakos" Sertix
	
	Description:
		Génères des patrouilles aléatoires dans certaines villes.
	
	Parameter(s):
		Nothing
	
	Returns:
		Nothing
*/

if (!randomCityPatrols) exitWith {};

private _grpGarn = objNull;

switch true do {
		case (nbJoueurs < 11): {
			//
			_grpGarn = GROUPE_ENI_2_MOYEN;
		};
		case (nbJoueurs > 10 && nbJoueurs < 17): {
			//
			_grpGarn = GROUPE_ENI_2_MOYEN;
		};
		case (nbJoueurs > 16 && nbJoueurs < 24): {
			//
			_grpGarn = GROUPE_ENI_2_GRAND;
		};
		case (nbJoueurs > 23): {
			//
			_grpGarn = GROUPE_ENI_2_GRAND;
		}; 
};

private _locations = [] call int_fnc_getAllLocations;

{
	private _curLocation = _x;
	private _curLocationSize = [
		getNumber(configfile >> "CfgWorlds" >> worldName >> "Names" >> text _curLocation >> "radiusA"),
		getNumber(configfile >> "CfgWorlds" >> worldName >> "Names" >> text _curLocation >> "radiusB")
	];
	
	// A changer en fonction du % de chance d'avoir une patrouille dans la ville.
	if ((ceil(random 100)) > 90) then {
		private _marker = createMarker [
			format ["Marker_occupied_city_%1", _forEachIndex],
			getPos _x
		];
		_marker setMarkerShape "ELLIPSE";

		if (_curLocationSize isEqualTo [0,0]) then {
			_marker setMarkerSize [350, 350];
		} else {
			_marker setMarkerSize _curLocationSize;
		};

		if (!isMultiplayer) then {
			systemChat format ["Spawning patrol units in %1", text _curLocation];
			_marker setMarkerColor "ColorCIV";
			_marker setMarkerBrush "Border";
		};
		
		private _grp = [(getMarkerPos _marker), opfor, (selectRandom _grpGarn)] call GDC_fnc_lucySpawnGroupInf;
		_grp setVariable ["PLUTO_ORDER","QRF"];
		[_grp, _marker] call GDC_fnc_lucyGroupRandomPatrol;
	};
} forEach _locations;
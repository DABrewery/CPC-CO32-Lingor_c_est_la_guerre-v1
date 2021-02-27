/* divers snippets pour les attributs de certains objets Eden (ex. SSS) */

if (alive TranportRenfort_CampNowhere_1 && !(isNull grpRenf_1)) then {
_grp = [TranportRenfort_CampNowhere_1, grpRenf_1, [getMarkerPos "mrkRenf_unload_3"], nil, nil, nil, [300, 600, 700]] spawn GDC_fnc_lucyTransportReinforcement;
grpRenf_1 setVariable ["PLUTO_ORDER","QRF"];
};

//On repère où sont les joueurs

//On spawne les mécas à une distance raisonnable

//On les envoie sur les joueurs

//L'infanterie débarque et le méca suit


_veh = [
	getMarkerPos "mrkSpawnZoubr_1",
	east, 
	"CUP_O_ZUBR_RU", 
	["CUP_O_RU_Crew","CUP_O_RU_Crew","CUP_O_RU_Crew","CUP_O_RU_Crew"],
	180
] call GDC_fnc_lucySpawnVehicle;

_waypoint = [_veh#0, getMarkerPos "mrkLandZoubr_1", 10, "SAD", "NORMAL", "AWARE", "RED", "RANDOM",100] call GDC_fnc_lucyAddWaypoint;
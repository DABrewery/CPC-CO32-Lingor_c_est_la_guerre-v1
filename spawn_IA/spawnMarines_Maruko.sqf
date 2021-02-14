"Ici le QG USMC. Demande bien reçue. Un Chinook posera une escouade de Marines au nord de l'aéroport de Maruko d'ici 15 à 20 minutes.\nAssurez-vous que toutes les menaces anti-aériennes sont neutralisées." remoteExec ["hint"];
"mrkDropInfant_Maruko" setMarkerAlpha 1.0;

GROUP_MARINES = [
	"rhsusf_usmc_marpat_wd_squadleader",
	"rhsusf_usmc_marpat_wd_teamleader",
	"rhsusf_usmc_marpat_wd_autorifleman",
	"rhsusf_usmc_marpat_wd_rifleman_m4",
	"rhsusf_usmc_marpat_wd_rifleman_m4",
	"rhsusf_usmc_marpat_wd_teamleader",
	"rhsusf_usmc_marpat_wd_autorifleman",
	"rhsusf_usmc_marpat_wd_rifleman_m4",
	"rhsusf_usmc_marpat_wd_riflemanat",
	"rhsusf_usmc_marpat_wd_autorifleman",
	"rhsusf_usmc_marpat_wd_rifleman_m4",
	"rhsusf_usmc_marpat_wd_marksman",
	"rhsusf_usmc_marpat_wd_teamleader",
	"rhsusf_usmc_marpat_wd_autorifleman",
	"rhsusf_usmc_marpat_wd_rifleman_m4",
	"rhsusf_usmc_marpat_wd_rifleman_m4"
];

_veh = [
	getMarkerPos "mrkSpawnMarines_Maruko_heli",
	west, 
	"RHS_CH_47F", 
	["rhsusf_army_ucp_helipilot", "rhsusf_army_ucp_helipilot", "rhsusf_army_ucp_helipilot", "rhsusf_army_ucp_helipilot"],
	0,
	["FLY", 300, 0]
] call GDC_fnc_lucySpawnVehicle;

grpMaruko = [
	getMarkerPos "mrkSpawnMarines_Sargento_infant",
	west,
	GROUP_MARINES
] call GDC_fnc_lucySpawnGroupInf;

[
	_veh#1,
	grpMaruko,
	[getMarkerPos "mrkDropInfant_Maruko"],
	[getMarkerPos "mrkSpawnMarines_Maruko_heli"],
	["NORMAL", "SAFE", "GREEN"],
	"true",
	[900,1000,1200],
	"
		_wp = grpMaruko addWaypoint [getMarkerPos 'mrkGnMarukoAir_1_2', -1];
		_wp setWaypointType 'SAD';
	",
	true
] call GDC_fnc_lucyTransportReinforcement;
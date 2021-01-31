//PLUTO Opfor
[
	opfor,		        //0 camp
	[1000,2000,6000],	//1 revealRange [man,land,air]
	[1500,2000,3000],	//2 sensorRange [man,land,air]
	120,			    //3 QRFtimeout
	[1000,2000,6000],	//4 QRFrange [man,land,air]
	[20,30,60],		    //5 QRFdelay [min,mid,max]
	240,			    //6 ARTYtimeout
	[20,30,60],		    //7 ARTYdelay [min,mid,max]
	[1,2,4],		    //8 ARTYrounds [min,mid,max]
	[0,40,100]		    //9 ARTYerror [min,mid,max]
] call GDC_fnc_pluto;

gdc_plutoDebug = false;

//Get number of players to allow dynamic hostile units number adaptation
nbJoueurs = playersNumber west;

/* Group definition */
	private _fsl    = "rhs_vmf_flora_rifleman";
	private _lat    = "rhs_vmf_flora_LAT";
	private _aa     = "rhs_vmf_flora_aa";
	private _at     = "rhs_vmf_flora_at";
	private _ass_at = "rhs_vmf_flora_strelok_rpg_assist";
	private _lmg    = "rhs_vmf_flora_junior_sergeant";
	private _mg     = "rhs_vmf_flora_machinegunner";
	private _ass_mg = "rhs_vmf_flora_machinegunner_assistant";
	private _gl     = "rhs_vmf_flora_grenadier";
	private _tl     = "rhs_vmf_flora_sergeant";
	private _sl     = "rhs_vmf_flora_officer_armored";
	private _medic  = "rhs_vmf_flora_medic";

// Groupes de max 4
GROUPE_OPFOR_PETIT = [
	[_fsl, _fsl],
	[_gl, _fsl],
	[_lmg, _fsl],
	[_tl, _fsl, _fsl],
	[_tl, _lat, _fsl],
	[_tl, _lmg, _fsl],
	[_tl, _lat, _fsl, _fsl],
	[_tl, _lmg, _fsl, _fsl],
	[_tl, _gl, _lmg , _fsl],
	[_tl, _mg, _ass_mg, _fsl]
];
// Groupes de 7
GROUPE_OPFOR_MOYEN = [
	[_tl, _lat, _lmg, _fsl, _fsl, _fsl, _fsl],
	[_tl, _mg, _ass_mg, _fsl, _fsl, _fsl, _fsl],
	[_tl, _gl, _lmg, _fsl, _fsl, _fsl, _fsl]
];
// Groupes de 14
GROUPE_OPFOR_GRAND = [
	[_sl, _medic, _tl, _at, _ass_at, _fsl, _fsl, _tl, _mg, _ass_mg, _fsl, _fsl, _tl, _gl]
];
// Groupes de 6
GROUPE_BLUFOR_PETIT_US = 
	["rhsusf_army_ucp_officer","rhsusf_army_ucp_maaws", "rhsusf_army_ucp_rifleman","rhsusf_army_ucp_machinegunner","rhsusf_army_ucp_rifleman","rhsusf_army_ucp_rifleman"];

//Spawn des hostiles
execVM "spawn_IA\spawnSargentoRadio_1.sqf";
execVM "spawn_IA\spawnSargentoRadio_2.sqf";
execVM "spawn_IA\spawnSargentoAir_1.sqf";
execVM "spawn_IA\spawnSargentoAir_2.sqf";
execVM "spawn_IA\spawnSargentoAir_3.sqf";
execVM "spawn_IA\spawnResearch102_1.sqf";
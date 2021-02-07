//PLUTO Opfor
[
	opfor,		        //0 camp
	[1000,2000,6000],	//1 revealRange [man,land,air]
	[1500,2000,3000],	//2 sensorRange [man,land,air]
	120,			    //3 QRFtimeout
	[1000,2000,6000],	//4 QRFrange [man,land,air]
	[60,90,120],		//5 QRFdelay [min,mid,max]
	240,			    //6 ARTYtimeout
	[20,30,60],		    //7 ARTYdelay [min,mid,max]
	[1,2,4],		    //8 ARTYrounds [min,mid,max]
	[0,40,100]		    //9 ARTYerror [min,mid,max]
] call GDC_fnc_pluto;

gdc_plutoDebug = true;

//Get number of players to allow dynamic ENI units number adaptation
nbJoueurs = playersNumber west + playersNumber resistance;

/* Group definition */
//Russians
	private _fsl_ENI_1    = "rhs_vmf_flora_rifleman";
	private _lat_ENI_1    = "rhs_vmf_flora_lat";
	private _aa_ENI_1     = "rhs_vmf_flora_aa";
	private _at_ENI_1     = "rhs_vmf_flora_at";
	private _ass_at_ENI_1 = "rhs_vmf_flora_strelok_rpg_assist";
	private _lmg_ENI_1    = "rhs_vmf_flora_junior_sergeant";
	private _mg_ENI_1     = "rhs_vmf_flora_machinegunner";
	private _ass_mg_ENI_1 = "rhs_vmf_flora_machinegunner_assistant";
	private _gl_ENI_1     = "rhs_vmf_flora_grenadier";
	private _tl_ENI_1     = "rhs_vmf_flora_sergeant";
	private _sl_ENI_1     = "rhs_vmf_flora_officer_armored";
	private _medic_ENI_1  = "rhs_vmf_flora_medic";

//2 à 4
GROUPE_ENI_1_PETIT = [
	[_gl_ENI_1, _fsl_ENI_1],
	[_lmg_ENI_1, _fsl_ENI_1],
	[_tl_ENI_1, _fsl_ENI_1, _fsl_ENI_1],
	[_tl_ENI_1, _lat_ENI_1, _fsl_ENI_1],
	[_tl_ENI_1, _lmg_ENI_1, _fsl_ENI_1],
	[_tl_ENI_1, _lat_ENI_1, _fsl_ENI_1, _fsl_ENI_1],
	[_tl_ENI_1, _lmg_ENI_1, _fsl_ENI_1, _fsl_ENI_1],
	[_tl_ENI_1, _gl_ENI_1, _lmg_ENI_1 , _fsl_ENI_1],
	[_tl_ENI_1, _mg_ENI_1, _ass_mg_ENI_1, _fsl_ENI_1]
];
//7 à 9
GROUPE_ENI_1_MOYEN = [
	[_tl_ENI_1, _lat_ENI_1, _lmg_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _fsl_ENI_1],
	[_tl_ENI_1, _mg_ENI_1, _ass_mg_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _fsl_ENI_1],
	[_tl_ENI_1, _gl_ENI_1, _lmg_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _fsl_ENI_1],
	[_tl_ENI_1, _gl_ENI_1, _lmg_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _fsl_ENI_1],
	[_tl_ENI_1, _lat_ENI_1, _lmg_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _fsl_ENI_1]
];
//14
GROUPE_ENI_1_GRAND = [
	[_sl_ENI_1, _medic_ENI_1, _tl_ENI_1, _at_ENI_1, _ass_at_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _tl_ENI_1, _mg_ENI_1, _ass_mg_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _tl_ENI_1, _gl_ENI_1]
];

//Local Gov
	private _fsl_ENI_2    = "rhsgref_tla_rifleman_pm63";
	private _lfsl_1_ENI_2 = "rhsgref_tla_rifleman_m14";
	private _lfsl_2_ENI_2 = "rhsgref_tla_rifleman_l1a1";
	private _lat_ENI_2    = "rhsgref_tla_rifleman_rpg75";
	private _at_ENI_2     = "rhsgref_tla_specialist_at";
	private _mg_ENI_2     = "rhsgref_tla_machinegunner_mg42";
	private _gl_ENI_2     = "rhsgref_tla_grenadier";
	private _tl_ENI_2     = "rhsgref_tla_squadleader";
	private _sl_ENI_2     = "rhs_vmf_flora_officer_armored";
	private _medic_ENI_2  = "rhsgref_tla_medic";

GROUPE_ENI_2_PETIT = [
	[_fsl_ENI_2, _lfsl_1_ENI_2],
	[_gl_ENI_2, _fsl_ENI_2],
	[_lfsl_2_ENI_2, _mg_ENI_2],
	[_tl_ENI_2, _fsl_ENI_2, _lfsl_1_ENI_2],
	[_tl_ENI_2, _lat_ENI_2, _fsl_ENI_2],
	[_tl_ENI_2, _mg_ENI_2, _fsl_ENI_2],
	[_tl_ENI_2, _lat_ENI_2, _fsl_ENI_2, _lfsl_1_ENI_2],
	[_tl_ENI_2, _mg_ENI_2, _fsl_ENI_2, _lfsl_2_ENI_2],
	[_tl_ENI_2, _gl_ENI_2, _fsl_ENI_2, _lfsl_1_ENI_2],
	[_tl_ENI_2, _mg_ENI_2, _lfsl_2_ENI_2, _lfsl_1_ENI_2]
];

GROUPE_ENI_2_MOYEN = [
	[_tl_ENI_2, _lat_ENI_2, _fsl_ENI_2, _fsl_ENI_2, _lfsl_1_ENI_2, _lfsl_2_ENI_2, _lfsl_2_ENI_2],
	[_tl_ENI_2, _mg_ENI_2, _fsl_ENI_2, _fsl_ENI_2, _lfsl_1_ENI_2, _lfsl_2_ENI_2, _lfsl_2_ENI_2],
	[_sl_ENI_2, _gl_ENI_1, _fsl_ENI_2, _fsl_ENI_2, _lfsl_1_ENI_2, _lfsl_2_ENI_2, _lfsl_2_ENI_2]
];

GROUPE_ENI_2_GRAND = [
	[_sl_ENI_2, _medic_ENI_2, _tl_ENI_2, _at_ENI_2, _fsl_ENI_2, _fsl_ENI_2, _fsl_ENI_2, _tl_ENI_2, _mg_ENI_2, _lfsl_2_ENI_2, _lfsl_2_ENI_2, _lfsl_2_ENI_2, _tl_ENI_2, _gl_ENI_2]
];

/*Spawn des ENIs*/

//Menace lourde initiale : un mortier, un SU-25 ou un Hind
_heavyThreat = selectRandom["myMortar", "mySU25", "myMI24" ];
switch _heavyThreat do {
	case "myMortar": {
		private _pos = getMarkerPos(selectRandom ["mrkMortar_1", "mrkMortar_2"]);
		private _spawn = [_pos, 180, "rhsgref_tla_2b14", east] call BIS_fnc_spawnVehicle;
		(_spawn#2) setVariable ["PLUTO_ORDER", "ARTY"];
	};
	case "mySU25": {
		private _pos = getMarkerPos(selectRandom ["mrkSU25_1", "mrkSU25_2"]);
		private _plane = createVehicle ["RHS_Su25SM_vvsc", _pos, [],0,"NONE"];
		_plane setdir 90;
		private _crew = createVehicleCrew _plane;
		[_crew, "mrkPlSU25_1", 5] spawn GDC_fnc_lucyGroupRandomPatrolFixPoints;
	};
	case "myMI24": {
		private _pos = getMarkerPos(selectRandom ["mrkMI24_1", "mrkMI24_2"]);
		private _heli = createVehicle ["RHS_Mi24V_vdv", _pos, [],0,"NONE"];
		private _crew = createVehicleCrew _heli;
		_crew setVariable ["PLUTO_ORDER", "QRF"];
	};
};

//Les camps
execVM "spawn_IA\spawnSargentoRadio_1.sqf";
execVM "spawn_IA\spawnSargentoRadio_2.sqf";
execVM "spawn_IA\spawnSargentoAir_1.sqf";
execVM "spawn_IA\spawnSargentoAir_2.sqf";
execVM "spawn_IA\spawnSargentoAir_3.sqf";
execVM "spawn_IA\spawnResearch102_1.sqf";
execVM "spawn_IA\spawnResearch101.sqf";
execVM "spawn_IA\spawnCampCastle.sqf";
execVM "spawn_IA\spawnCampMorada.sqf";
execVM "spawn_IA\spawnCampNowhere.sqf";
execVM "spawn_IA\spawnMunDep1.sqf";
execVM "spawn_IA\spawnMunDep2.sqf";
execVM "spawn_IA\spawnCheckPointSur.sqf";
execVM "spawn_IA\spawnCheckPointOeste.sqf";
execVM "spawn_IA\spawnCorazon_1.sqf";
execVM "spawn_IA\spawnFOBEddie.sqf";
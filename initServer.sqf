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

gdc_plutoDebug = false;

//Cache ZBE
//[1000,-1,true,1000,1000,1000] execVM "zbe_cache\main.sqf";

//Get number of players to allow dynamic ENI units number adaptation
nbJoueurs = count (playableUnits + (switchableUnits select {_x != HC_Slot}));

//Server variables
isPrisonLib = false;
isPlayerDetected = false;
isHVTKilled = false;
computer_lab101 setVariable ["challengeSuccessfull", false, true];
computer_lab101 setVariable ["isBeeingChallenged", false, true];
computer_lab102 setVariable ["challengeSuccessfull", false, true];
computer_lab102 setVariable ["isBeeingChallenged", false, true];
computer_Sargento setVariable ["challengeSuccessfull", false, true];
computer_Sargento setVariable ["isBeeingChallenged", false, true];
computer_Maruko setVariable ["challengeSuccessfull", false, true];
computer_Maruko setVariable ["isBeeingChallenged", false, true];

/*******************************************/
/*                CARGO                    */
/*******************************************/

loadCargo = {
	params ["_veh","_cargo"];
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	switch (_cargo) do {
		case "cargo_1": {
			_veh addItemCargoGlobal ["rhs_mag_rgd5",200];
			_veh addItemCargoGlobal ["rhs_mag_rgo",200];
			_veh addMagazineCargoGlobal ["rhs_100Rnd_762x54mmR_green",100];
			_veh addMagazineCargoGlobal ["rhs_100Rnd_762x54mmR_7N26",300];
			_veh addMagazineCargoGlobal ["rhs_30Rnd_545x39_7N6M_AK",500];
			_veh addMagazineCargoGlobal ["rhs_mag_9x19_17",200];
			_veh addWeaponCargoGlobal ["rhs_weap_rpg7",10];
			_veh addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag",40];		
			_veh addMagazineCargoGlobal ["rhs_mag_9x19_17",200];
			_veh addItemCargoGlobal ["ACE_EntrenchingTool",20];
			_veh addMagazineCargoGlobal ["rhs_mag_nspn_green",50];
			_veh addMagazineCargoGlobal ["rhs_mag_nspn_red",50];
			_veh addItemCargoGlobal ["rhs_mag_rdg2_white",50];
			_veh addItemCargoGlobal ["rhs_mag_rdg2_black",50];
		};
		case "cargo_2": {
			_veh addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag",10];
			_veh addMagazineCargoGlobal ["rhs_mine_pmn2_mag",10];
			_veh addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag",10];
			_veh addMagazineCargoGlobal ["DemoCharge_Remote_Mag",10];
		};
		case "cargo_3": {
			_veh addMagazineCargoGlobal ["rhs_100Rnd_762x54mmR_green",20];
			_veh addMagazineCargoGlobal ["rhs_100Rnd_762x54mmR_7N26",50];
			_veh addMagazineCargoGlobal ["rhs_30Rnd_545x39_7N6M_AK",100];
			_veh addMagazineCargoGlobal ["rhs_mag_nspn_green",40];
			_veh addMagazineCargoGlobal ["rhs_mag_nspn_red",40];
		};
		case "cargo_4": {
			_veh addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag",40];
			_veh addMagazineCargoGlobal ["rhs_rpg7_OG7V_mag",20];
			_veh addMagazineCargoGlobal ["rhs_rpg7_TBG7V_mag",20];
			_veh addBackpackCargoGlobal ["rhs_rpg_empty",15];
		};
		case "cargo_5": {
			_veh addItemCargoGlobal ["ACE_packingBandage",300];
			_veh addItemCargoGlobal ["ACE_quikclot",300];
			_veh addItemCargoGlobal ["ACE_elasticBandage",300];
			_veh addItemCargoGlobal ["ACE_fieldDressing",400];
			_veh addItemCargoGlobal ["ACE_salineIV_250",80];
			_veh addItemCargoGlobal ["ACE_salineIV_500",60];
			_veh addItemCargoGlobal ["ACE_salineIV",50];
			_veh addItemCargoGlobal ["ACE_morphine",50];
			_veh addItemCargoGlobal ["ACE_atropine",50];
			_veh addItemCargoGlobal ["ACE_tourniquet",40];
			_veh addItemCargoGlobal ["ACE_surgicalKit",5];
			_veh addItemCargoGlobal ["ACE_splint",100];
			_veh addItemCargoGlobal ["Toolkit",5];
			_veh addItemCargoGlobal ["ACE_Wirecutter",10];
			_veh addItemCargoGlobal ["ACE_Cabletie",50];
			_veh addItemCargoGlobal ["ACE_Banana",200];
			_veh addItemCargoGlobal ["ACE_Bodybag",50];
			_veh addBackpackCargoGlobal ["rhsgref_ttsko_alicepack",10];
			_veh addBackpackCargoGlobal ["CUP_B_ACRPara_dpm",10];
		};
		case "cargo_lab101": {
			_veh addItemCargoGlobal ["V_MU_EOD_AAF", 2];
		};
		case "cargo_lab102": {
			_veh addItemCargoGlobal ["V_MU_Rebreather_rus", 2];
		};
	};
};

//Ajoute le cargo des véhicules, caisses, etc.
[caisse_mun_1,"cargo_1"] call loadCargo;
[caisse_mun_2,"cargo_3"] call loadCargo;
[caisse_mun_3,"cargo_5"] call loadCargo;
[caisse_mun_4,"cargo_2"] call loadCargo;
[caisse_mun_5,"cargo_1"] call loadCargo;
[caisse_mun_6,"cargo_1"] call loadCargo;
[caisse_mun_7,"cargo_1"] call loadCargo;
[caisse_mun_8,"cargo_5"] call loadCargo;
[caisse_mun_9,"cargo_2"] call loadCargo;
[caisse_mun_10,"cargo_3"] call loadCargo;
[caisse_lab101,"cargo_lab101"] call loadCargo;
[caisse_lab102,"cargo_lab102"] call loadCargo;


/*******************************************/
/*         IA GROUP DEF                    */
/*******************************************/
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

/*******************************************/
/*        ENI Spawn                        */
/*******************************************/

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

//Les camps et objectifs
execVM "spawn_IA\spawnSargentoRadio_1.sqf";
execVM "spawn_IA\spawnSargentoRadio_2.sqf";
execVM "spawn_IA\spawnMarukoRadio.sqf";
execVM "spawn_IA\spawnSargentoAir_1.sqf";
execVM "spawn_IA\spawnSargentoAir_2.sqf";
execVM "spawn_IA\spawnSargentoAir_3.sqf";
execVM "spawn_IA\spawnMarukoAir_1.sqf";
execVM "spawn_IA\spawnMarukoAir_2.sqf";
execVM "spawn_IA\spawnMarukoAir_3.sqf";
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
execVM "spawn_IA\spawnPrison.sqf";

//Les renforts perpétuels... La Russie est grande ;-)
execVM "spawn_IA\spawnParadrop.sqf";
execVM "spawn_IA\spawnMecas.sqf";

//Script pour les projecteurs de nuit
[] spawn int_fnc_initSearchlight;
[] call int_fnc_clearWaypoints; 
//Récupère la liste de tous les marqueurs LUCY pour les masquer et les blacklister pour GDC_fnc_chooseSpawnPos
private _tbMrk = allMapMarkers select {["mrk", _x, true] call BIS_fnc_inString};

//Masque les marqueurs
{_x setMarkerAlpha 0.0} forEach _tbMrk;

//LUCY (-> lancé dans l'init.sqf)
[0.5,"mkr_spawn_static_unit",true,600.0,false,3600.0,true,true,"COLONEL"] call GDC_fnc_lucyInit;

//["loadout\loadout.sqf"] call GDC_fnc_lucyConfigLoadoutIA;

//test EH scripté
[true, "MonEvent", { hint format ["Hello %1. %2", _this select 0, _this select 1]}] call BIS_fnc_addScriptedEventHandler;

//Variables de gestion des supports logistiques. La variable est passée à faux si le support est endommagé ou détruit, ce qui inactive le support (cf. code d'init personnalisé du module logistic de SSS)
isSupportNorthDispo = true;
isSupportWestDispo = true;
isSupportSouthDispo = true;

//Actions ACE des objets d'évac/fin de partie
_action_win = [ 
 "finMissionWin", 
 "Fin de mission : réussite", 
 "", 
 { 
	["end1",true, 4] remoteExecCall ['BIS_fnc_endMission',0];
 }, 
 {true} 
] call ace_interact_menu_fnc_createAction;

_action_loose = [ 
 "finMissionLoose", 
 "Fin de mission : défaite", 
 "", 
 { 
	["end2", false, 4] remoteExecCall ['BIS_fnc_endMission',0];
 }, 
 {true} 
] call ace_interact_menu_fnc_createAction;

[evac_win_1, 0, ["ACE_MainActions"], _action_win] call ace_interact_menu_fnc_addActionToObject;
[evac_win_2, 0, ["ACE_MainActions"], _action_win] call ace_interact_menu_fnc_addActionToObject;
[evac_win_3, 0, ["ACE_MainActions"], _action_win] call ace_interact_menu_fnc_addActionToObject;
[evac_win_4, 0, ["ACE_MainActions"], _action_win] call ace_interact_menu_fnc_addActionToObject;

[evac_loose_1, 0, ["ACE_MainActions"], _action_loose] call ace_interact_menu_fnc_addActionToObject;
[evac_loose_2, 0, ["ACE_MainActions"], _action_loose] call ace_interact_menu_fnc_addActionToObject;
[evac_loose_3, 0, ["ACE_MainActions"], _action_loose] call ace_interact_menu_fnc_addActionToObject;
[evac_loose_4, 0, ["ACE_MainActions"], _action_loose] call ace_interact_menu_fnc_addActionToObject;

//Actions ACE lab 101 
_action_hack_bf = [
	"HackSystem",
	"Hacker le système : attaque par force brute",
	"",
	{
		[
			15,
			[],
			{
				computer_lab101 setObjectTextureGlobal [1,"img\hacker_1.jpg"];
				computer_lab101 setObjectTextureGlobal [2,"img\hacker_1.jpg"];
				computer_lab101 setObjectTextureGlobal [3,"img\hacker_1.jpg"];
				[computer_lab101, 600] spawn int_fnc_probaChallenge;
				// Test only ! [computer_lab101, 60] spawn int_fnc_probaChallenge;
			}, 
			{hint "Challenge system connection aborted"},
			"Connexion et initialisation du système de piratage. Merci de patienter..."
		] call ace_common_fnc_progressBar;	
	},
	{!(computer_lab101 getVariable "challengeSuccessfull") && !(computer_lab101 getVariable "isBeeingChallenged")}
] call ace_interact_menu_fnc_createAction;
[computer_lab101, 0, ["ACE_MainActions"], _action_hack_bf] call ace_interact_menu_fnc_addActionToObject;

_action_hack_dico = [
	"HackSystem",
	"Hacker le système : attaque par dictionnaire",
	"",
	{
		[15, [], {[computer_lab101, 300, [0.0001,0.001,0.002,0.023]] spawn int_fnc_probaChallenge;},{hint "Challenge system connection aborted"}, "Connexion et initialisation du système de piratage. Merci de patienter..."] call ace_common_fnc_progressBar;
	},
	{!(computer_lab101 getVariable "challengeSuccessfull") && !(computer_lab101 getVariable "isBeeingChallenged")}
] call ace_interact_menu_fnc_createAction;
[computer_lab101, 0, ["ACE_MainActions"], _action_hack_dico] call ace_interact_menu_fnc_addActionToObject;

_action_unlock_crate = [
	"UnlockCrate",
	"Déverrouiler la caisse",
	"",
	{
		[
			5,
			[],
			{
				[caisse_lab101, false] remoteExec ["lockInventory"];
				[light_green_lab101, "ON"] remoteExec ["switchLight"];
				[light_red_lab101, "OFF"] remoteExec ["switchLight"];
			}, 
			{hint "Déverrouillage annulé"},
			"Déverrouillage de la caisse en cours. Merci de patienter..."
		] call ace_common_fnc_progressBar;	
	},
	{(computer_lab101 getVariable "challengeSuccessfull")}
] call ace_interact_menu_fnc_createAction;
[computer_lab101, 0, ["ACE_MainActions"], _action_unlock_crate] call ace_interact_menu_fnc_addActionToObject;

_action_interro = [
	"Interro",
	"Interroger le scientifique",
	"",
	{
		[
			2,
			[],
			{
				hint "J'ai développé cette technologie qui soigne les blessures très rapidement. Il vous suffit de porter ces gilets de protection.\nMalheureusement, cela n'empêche pas la douleur et il est possible que ce ne soit pas complètement au point."
			}, 
			{hint "Interrogatoire interrompu"},
			"Le scientifique réfléchit à sa réponse..."
		] call ace_common_fnc_progressBar;	
	},
	{(computer_lab101 getVariable "challengeSuccessfull") && (alive scientist101)}
] call ace_interact_menu_fnc_createAction;
[scientist101, 0, ["ACE_MainActions"], _action_interro] call ace_interact_menu_fnc_addActionToObject;

//Actions ACE lab 102 
_action_hack_bf = [
	"HackSystem",
	"Hacker le système : attaque par force brute",
	"",
	{
		[
			15,
			[],
			{
				computer_lab102 setObjectTextureGlobal [1,"img\hacker_1.jpg"];
				computer_lab102 setObjectTextureGlobal [2,"img\hacker_1.jpg"];
				computer_lab102 setObjectTextureGlobal [3,"img\hacker_1.jpg"];
				[computer_lab102, 600] spawn int_fnc_probaChallenge;
				// Test only ! [computer_lab102, 60] spawn int_fnc_probaChallenge;
			}, 
			{hint "Challenge system connection aborted"},
			"Connexion et initialisation du système de piratage. Merci de patienter..."
		] call ace_common_fnc_progressBar;	
	},
	{!(computer_lab102 getVariable "challengeSuccessfull") && !(computer_lab102 getVariable "isBeeingChallenged")}
] call ace_interact_menu_fnc_createAction;
[computer_lab102, 0, ["ACE_MainActions"], _action_hack_bf] call ace_interact_menu_fnc_addActionToObject;

_action_hack_dico = [
	"HackSystem",
	"Hacker le système : attaque par dictionnaire",
	"",
	{
		[15, [], {[computer_lab102, 300, [0.0001,0.001,0.002,0.023]] spawn int_fnc_probaChallenge;},{hint "Challenge system connection aborted"}, "Connexion et initialisation du système de piratage. Merci de patienter..."] call ace_common_fnc_progressBar;
	},
	{!(computer_lab102 getVariable "challengeSuccessfull") && !(computer_lab102 getVariable "isBeeingChallenged")}
] call ace_interact_menu_fnc_createAction;
[computer_lab102, 0, ["ACE_MainActions"], _action_hack_dico] call ace_interact_menu_fnc_addActionToObject;

_action_unlock_crate = [
	"UnlockCrate",
	"Déverrouiler la caisse",
	"",
	{
		[
			5,
			[],
			{
				[caisse_lab102, false] remoteExec ["lockInventory"];
				[light_green_lab102, "ON"] remoteExec ["switchLight"];
				[light_red_lab102, "OFF"] remoteExec ["switchLight"];
			}, 
			{hint "Déverrouillage annulé"},
			"Déverrouillage de la caisse en cours. Merci de patienter..."
		] call ace_common_fnc_progressBar;	
	},
	{(computer_lab102 getVariable "challengeSuccessfull")}
] call ace_interact_menu_fnc_createAction;
[computer_lab102, 0, ["ACE_MainActions"], _action_unlock_crate] call ace_interact_menu_fnc_addActionToObject;

//Actions ACE Sargento
_action_hack_bf = [
	"HackSystem",
	"Tenter de pirater l'antenne radio",
	"",
	{
		[
			15,
			[],
			{
				computer_Sargento setObjectTextureGlobal [0,"img\hacker_1.jpg"];
				//[computer_lab101, 300] spawn int_fnc_probaChallenge;
				// Test only ! 
				[computer_Sargento, 60] spawn int_fnc_probaChallenge;
			}, 
			{hint "Challenge system connection aborted"},
			"Connexion et initialisation du système de piratage. Merci de patienter..."
		] call ace_common_fnc_progressBar;	
	},
	{!(computer_Sargento getVariable "challengeSuccessfull") && !(computer_Sargento getVariable "isBeeingChallenged")}
] call ace_interact_menu_fnc_createAction;
[computer_Sargento, 0, ["ACE_MainActions"], _action_hack_bf] call ace_interact_menu_fnc_addActionToObject;

_action_call_marines = [
	"CallMarines",
	"Demander un débarquement des Marines",
	"",
	{
		[
			10,
			[],
			{
				execVM "spawn_IA\spawnMarines_Sargento.sqf";
			}, 
			{hint "Appel annulé"},
			"Appel en cours. Merci de patienter..."
		] call ace_common_fnc_progressBar;	
	},
	{(computer_Sargento getVariable "challengeSuccessfull")}
] call ace_interact_menu_fnc_createAction;
[computer_Sargento, 0, ["ACE_MainActions"], _action_call_marines] call ace_interact_menu_fnc_addActionToObject;

//Actions ACE Maruko
_action_hack_bf = [
	"HackSystem",
	"Tenter de pirater l'antenne radio",
	"",
	{
		[
			15,
			[],
			{
				computer_Maruko setObjectTextureGlobal [0,"img\hacker_1.jpg"];
				//[computer_lab101, 300] spawn int_fnc_probaChallenge;
				// Test only ! 
				[computer_Maruko, 60] spawn int_fnc_probaChallenge;
			}, 
			{hint "Challenge system connection aborted"},
			"Connexion et initialisation du système de piratage. Merci de patienter..."
		] call ace_common_fnc_progressBar;	
	},
	{!(computer_Maruko getVariable "challengeSuccessfull") && !(computer_Maruko getVariable "isBeeingChallenged")}
] call ace_interact_menu_fnc_createAction;
[computer_Maruko, 0, ["ACE_MainActions"], _action_hack_bf] call ace_interact_menu_fnc_addActionToObject;

_action_call_marines = [
	"CallMarines",
	"Demander un débarquement des Marines",
	"",
	{
		[
			10,
			[],
			{
				execVM "spawn_IA\spawnMarines_Maruko.sqf";
			}, 
			{hint "Appel annulé"},
			"Appel en cours. Merci de patienter..."
		] call ace_common_fnc_progressBar;	
	},
	{(computer_Maruko getVariable "challengeSuccessfull")}
] call ace_interact_menu_fnc_createAction;
[computer_Maruko, 0, ["ACE_MainActions"], _action_call_marines] call ace_interact_menu_fnc_addActionToObject;

// Init Shinriel's SuperPowers scripts
call compileFinal preprocessFileLineNumbers "functions\powers\commons.sqf";
player addEventHandler ["InventoryClosed", { 
	[_this#0, "V_MU_EOD_AAF", "regenerate"] call int_fnc_activatePowerWithObject;
	[_this#0, "V_MU_Rebreather_rus", "infinite_stamina"] call int_fnc_activatePowerWithObject;;
}];

//Lance le briefing
execVM "briefing.sqf";
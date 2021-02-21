/* divers snippets pour les attributs de certains objets Eden (ex. SSS) */


//Loadout des caisses larguées par SSS logistics (List function attribute)
[
	"B_Quadbike_01_F",
	"B_LSV_01_armed_F",
	"B_MRAP_01_hmg_F",
	[
		"B_supplyCrate_F",
		"Muntions",
		"\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\rearm_ca.paa",
		{
			clearItemCargoGlobal _this;
			clearMagazineCargoGlobal _this;
			clearWeaponCargoGlobal _this;
			clearBackpackCargoGlobal _this;
			_this addWeaponCargoGlobal ["arifle_MX_F",4];
			_this addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag",40];
			_this addWeaponCargoGlobal ["arifle_TRG21_F",4];
			_this addMagazineCargoGlobal ["30Rnd_556x45_Stanag",40];
			_this addWeaponCargoGlobal ["srifle_EBR_F",2];
			_this addMagazineCargoGlobal ["20Rnd_762x51_Mag",20];
		}
	]
]

//Code d'initialisation personnalisé du module SSS logistic pour supprimer le support logistique si l'appareil a été endommagé
_this addEventHandler ["dammaged", {"Le support logistique pour la DZ Nord a été endommagé ou détruit.\nIl ne sera plus disponible." remoteExec ["hint"]; isSupportNorthDispo = false;publicVariable "isSupportNorthDispo"}];
_this addEventHandler ["dammaged", {"Le support logistique pour la DZ Ouest a été endommagé ou détruit.\nIl ne sera plus disponible." remoteExec ["hint"]; isSupportWestDispo = false;publicVariable "isSupportWestDispo"}];
_this addEventHandler ["dammaged", {"Le support logistique pour la DZ Sud a été endommagé ou détruit.\nIl ne sera plus disponible." remoteExec ["hint"]; isSupportNorthDispo = false;publicVariable "isSupportSouthDispo"}];


[["rhs_weap_m4a1_mstock_grip3","rhsusf_acc_SF3P556","rhsusf_acc_anpeq15_top","rhsusf_acc_eotech_xps3",["rhs_mag_30Rnd_556x45_Mk318_Stanag",30],[],"rhsusf_acc_rvg_blk"],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["rhs_uniform_g3_m81",[["FirstAidKit",1],["rhsusf_ANPVS_15",1],["rhs_Booniehat_m81",1]]],["rhsusf_mbav_medic",[["rhsusf_acc_nt4_black",1],["rhs_mag_30Rnd_556x45_Mk318_Stanag",6,30],["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["rhs_mag_an_m8hc",1,1],["rhs_mag_mk84",1,1],["rhs_mag_m67",2,1],["Chemlight_red",3,1]]],["rhsusf_assault_eagleaiii_coy_engineer",[["ToolKit",1]]],"rhsusf_mich_bare_norotos_arc_alt_tan","rhs_googles_black",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
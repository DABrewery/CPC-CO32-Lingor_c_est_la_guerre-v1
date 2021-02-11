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

//Code d'initialisation personnalisé pour supprimer le support logistique si l'appareil a été endommagé
_this addEventHandler ["dammaged", {"Le support logistique pour la DZ Nord a été endommagé ou détruit.\nIl ne sera plus disponible." remoteExec ["hint"]; isSupportNorthDispo = false;publicVariable "isSupportNorthDispo"}];
_this addEventHandler ["dammaged", {"Le support logistique pour la DZ Ouest a été endommagé ou détruit.\nIl ne sera plus disponible." remoteExec ["hint"]; isSupportWestDispo = false;publicVariable "isSupportWestDispo"}];
_this addEventHandler ["dammaged", {"Le support logistique pour la DZ Sud a été endommagé ou détruit.\nIl ne sera plus disponible." remoteExec ["hint"]; isSupportNorthDispo = false;publicVariable "isSupportSouthDispo"}];
class Params
{
	class NbAI
	{
		title = "Nombre d'IA hostiles";
		texts[] = {
			"Auto (selon nombre de joueurs au lancement de la mission)",
			"Faible (10 joueurs ou moins)",
			"Modéré (entre 11 et 16 joueurs)",
			"Elevé (entre 17 et 23 joueurs)",
			"Très élevé (entre 24 et 32 joueurs)"
			};
		values[] = {0,10,16,17,24};
		default = 0;
	};
	
	class firstRegroupeDelay
	{
		title = "Delai minimum avant le premier regroupement";
		texts[] = {"1 minute","5 minutes","10 minutes","20 minutes","30 minutes"};
		values[] = {60,300,600,1200,1800};
		default = 1800;
	};
	class otherRegroupeDelay
	{
		title = "Delai minimum avant les regroupements suivants";
		texts[] = {"1 minute","20 minutes","30 minutes","40 minutes","60 minutes"};
		values[] = {60,1200,1800,2400,3600};
		default = 1800;
	};
};
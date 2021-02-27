/* Briefing au format sqf */

//Crédits
player createDiaryRecord ["Diary", ["Crédits", "

<font color='#ff0505'>Lingor : c'est la guerre</font color><br/><br/>

Auteur : tanin69<br/><br/>

<font color='#ff9605'>Merci à Mystery, Sparfell, Shinriel pour les bibliothèques de GDC_Lib https://github.com/GdC-Framework/GdC_lib/<br/>
> Re-merci à Shinriel pour les scripts déments de super pouvoirs<br/>
> Merci à [GIE] Gavin 'Morbakos' Sertix pour plusieurs scripts intégrés en routine dans mes missions</font><br/><br/>

<font color='#82ff05'>Remerciements spéciaux à<br/>
> Bruno (aka SBS) pour l'inspiration initiale : parce que oui, c'est une mission pensée d'abord pour une seconde partie de soirée (et les secondes parties de soirée avec Bruno, c'est juste vraiment bien)<br/>
> Mystery (vache sacrée) parce qu'il est toujours là, même s'il se fait chier pendant 90% des parties. Il m'a poussé à introduire de la SURPRISE dans cette mission (et les autres), mais on verra à l'usage si c'est réussi<br/>
> Sparfell (autre vache sacrée) parce que les mythiques cache-cash m'ont donné envie de faire une mission à longue durée de vie... Différente<br/><br/>

<font color='#ff0505'>Remerciements éternels<br/>
> A tous les canards, vous savez bien pourquoi !<br/>
> A ma femme qui ne m'a pas encore pas quitté, je ne sais toujours pas pourquoi (en dehors de mes talents sexuels exceptionnels, mais ça n'explique quand même pas tout)

"]];


//Insertion et fin de mission
player createDiaryRecord ["Diary", ["Insertion et fin de mission", "

<font color='#82ff05'>Insertion</font color><br/>
Insertion au choix en dehors de zones rouges.<br/><br/>
Sur les campements BLUFOR (<marker name='marker_camp_North'>au nord</marker>, à <marker name='marker_camp_West'>l'ouest</marker> et au <marker name='marker_camp_South'>sud est</marker>), vous avez la possibilité de faire une pause jusqu'au moment de la journée (ou de la nuit) qui vous parait propice à votre opération (interaction ACE sur le feu de camp).<br/><br/>

<font color='#82ff05'>Fin de mission</font color><br/>
S'il y a des survivants à la fin de l'opération, ils doivent impérativement s'extraire sur un des quatre points suivants : soit <marker name='evac_1'>à l'est</marker>, soit <marker name='evac_2'>au nord</marker>, soit <marker name='evac_3'>au sud ouest</marker>, soit <marker name='evac_4'>au sud est</marker>. En clair (faut vraiment tout vous dire), prévoyez votre route de retraite dès la planification initiale, ça fait partie du plan.<br/>
Une fois sur le point d'évac, faites une interaction ACE sur une des helipad light au pied du drapeau : vert pour victoire et rouge pour défaite.

"]];

//Logistique
player createDiaryRecord ["Diary", ["Logistique", "

<font color='#82ff05'>Réapprovisionnement</font color><br/>
Seuls les MARSOC équipés d'une PRC-148 sont en mesure de demander du réappro ! (SSS - interaction ACE sur vous-même)<br/>
A proximité de vos campements (<marker name='marker_camp_North'>au nord</marker>, à <marker name='marker_camp_West'>l'ouest</marker> et au <marker name='marker_camp_South'>sud est</marker>), vous disposez de 3 zones à partir desquelles vous pouvez appeler des collègues pour vous faire larguer du réappro.<br/>
Vous pouvez vous faire larguer le stuff n'importe où... Mais attention : si l'appareil de réappro est endommagé ou détruit, vous ne disposerez plus de logistique sur cette zone.<br/><br/>

<font color='#82ff05'>Réparations</font color><br/>
Vous êtes tous des bricolos corrects : vous pouvez procéder à la plupart des réparations de base. Néanmoins :<br/>
> Le nombre de pièces détachées est limité (un toolkit consommé à chaque réparation) et vous ne pourrez pas réparer l'intégralité des dégâts.<br/>
> Certains Picaros (bricoleurs de génie) sont d'anciens mécaniciens de l'armée locale : ils peuvent réparer intégralement tout équipement à condition de trouver un centre de réparation et de disposer de pièces détachées.

"]];

//Equipement
player createDiaryRecord ["Diary", ["Equipement", "

<font color='#ff8205'>Récupération de matériel</font color><br/>
Il y a fort à parier que vous pourrez voler beaucoup de matériel, y/c du lourd : sachez en tirer profit !<br/>
> Tous les personnels peuvent récupérer les armes légères et conduire les véhicules légers (rappel : un URAL est un véhicule léger). Les MARSOC savent également se servir des armements de type .50, qu'ils soient au sol ou embarqués (parce que ce sont des MARSOC, quand même)<br/>
> Les Picaros (et uniquement eux) peuvent opérer tous les équipements récupérés: blindés lours ou légers, aéronefs... Seules les compétences disponibles dans l'équipe limitent leurs possibilités.<br/><br/>

<font color='#ff8205'>MARSOC</font color><br/>
Ben, ce sont des MARSOC : suréquipés...

En quelque sorte :<br/><br/>

<font color='#ff8205'>Picaros</font color><br/>
Armement de type russe. Pas de protection balistique parce que les chefs Picaros disent que c'est pour les tafioles. Même s'il est censé bien connaitre le terrain, le CdO Picaros a quand même réussi à négocier un micro-DAGR auprès des MARSOC. En plus d'une équipe d'assaut courageuse, les Picaros peuvent engager :<br/>
> Une PKP amoureusement entretenue<br/>
> Du snipper (VDV + M145 MGO)<br/>
> Du grenadier (GP-25 bien stuffé)<br/>
> De l'AA (Igla)<br/>
> De l'AT (RPG-7 + PGO)<br/><br/>

<font color='#ff8205'>Caisses</font color><br/>
Vous avez pu emmener avec vous 3 caisses de matos jusqu'à votre point d'insertion :<br/>
> Du matos US avec de l'équipement pour OP nocturne et deux trois babioles, dont des radios LP et CP supplémentaires, mais surtout le drone Raven<br/>
> Du matos Picaros avec le même type de stuff que les MARSOC, mais en version russe<br/>
> Du matos médical, dont du sang (tous les samedis matins sur la place de l'Eglise) pour ce vampire de Thétard<br/>

"]];

//Intel
player createDiaryRecord ["Diary", ["Renseignements", "

<font color='#ff0505'>Forces hostiles</font color><br/>
> Zones clés : vous avez en face de vous la marine russe (VMF) et les para (VDV) : c'est du lourd, du très lourd.<br/>
> Autres zones : l'armée locale. Mal équipée, mal entrainée, surtout qu'une partie importante des meilleurs effectifs a rejoint les Picaros.<br/><br/>

<font color='#ff0505'>Menaces lourdes</font color><br/>
On va se prendre sur la gueule soit un Mi-24, soit un Su-25, soit un mortier. Mais on ne sait pas laquelle de ces trois menace sera active.<br/><br/>

<font color='#ff0505'>Renforts sur les objectifs</font color><br/>
> On pense que l'infanterie interviendra dans un rayon d'environ 1 km autour de son point de garnison<br/>
> Les éléments mécanisés (des BTR-80 et des BRDM sont présents sur zone) dans un rayon de 3 km<br/>
> Les éléments motorisés (troupes transportées par camion)... Ben on sait pas.<br/>
> Evidemment, les menaces lourdes devraient intervenir sur l'ensemble de la zone.<br/><br/>

<font color='#ff0505'>Renforts extérieurs</font color><br/>
On pense que les russes réagiront et enverront des renforts aéroportés (VDV), voire d'autres types d'unités. Mais on ne sait ni quand, ni où, ni comment. A priori, on devrait pouvoir respirer durant les 30/40 premières minutes de l'opération. Après, on n'est sûr de rien.

"]];

//Mission
player createDiaryRecord ["Diary", ["Objectifs (accroche-toi, mon canard)", "

10 objectifs au choix, chaque objectif constituant en lui-même une mission. Planifiez chacun des objectifs avec soin... (conseil d'ami).<br /><br />

(cliquez sur le titre de l'objectif)<br/><br/>

<font color='#ff0505'><marker name='marker_objective_researchLab101'>Steal technology, research Lab 101</marker></font color><br/>
Si réussite : vous procure un avantage technologique majeur, après hacking difficile d'un système.<br/><br/>

<font color='#ff0505'><marker name='marker_objective_researchLab102'>Steal technology, research Lab 102</marker></font color><br/>
Si réussite : vous procure un avantage technologique important, après hacking difficile d'un système.<br/><br/>

<font color='#ff0505'><marker name='marker_objective_freeComrades'>Free the comrades</marker></font color><br/>
Si réussite : une opération de sabotage est déclenchée par les Picaros si au moins un prisonnier rejoint la cache dans la jungle.<br/><br/>

<font color='#ff0505'><marker name='marker_objective_militaryHQ'>Kill the High Value Target</marker></font color><br/>
Si réussite : les renforts extérieurs ont moins de chances d'arriver.<br/><br/>

<font color='#ff0505'>Neutralize air support : <marker name='marker_objective_MarukoAirport'>Maruko </marker> ou <marker name='marker_objective_SargentoAirport'>Sargento</marker></marker></font color> (Dangerous Baby !!)<br/>
Si réussite : sécurise l'espace aérien environnant.<br/><br/>

<font color='#ff0505'>Hack the radio station : <marker name='marker_objective_radioStation_2'>Maruko</marker> ou <marker name='marker_objective_radioStation_1'>Sargento</marker></marker></font color><br/>
Si réussite : permet d'appeler une escouade de Marines héliportée sur l'aéroport à proximité, après hacking simple d'un système.<br/><br/>

<font color='#ff0505'>Destroy the ammunition Depot : <marker name='marker_objective_CampMarpaso'>camp Marpaso</marker> ou <marker name='marker_objective_OesteHarbor'>Camp Oeste Harbor</marker></font color><br/>
Si réussite : possibilité de récupérer des munitions diverses et des explosifs (si vous n'êtes pas trop maladroits, parce que les dépôts, ça fait KA-BOUM), puis magnifiques explosions.
"]];

//Situation
player createDiaryRecord ["Diary", ["Situation", "

La marine russe occupe les points clés : les deux aéroports principaux (<marker name='marker_objective_MarukoAirport'>Maruko International Airport</marker> et <marker name='marker_objective_SargentoAirport'>Sargento Airport</marker>) et quelques points stratégiques.<br />
En dehors de cela, c'est l'armée locale qui a la charge de la surveillance des points d'intérêts.<br /><br />

Pour le moment, les troupes russes et locales sont dans leurs garnisons et ne patrouillent qu'à proximité immédiate. En clair, cela signifie que tant que vous n'êtes pas repérés, vos déplacements sont sûrs.<br /><br />

A part ça, TOUT peut arriver...

"]]; 

//Contexte
player createDiaryRecord ["Diary", ["Contexte", "

Lingor est sous l'emprise d'une dictature sanglante. Elle est directement soutenue par l'armée russe.<br />
Votre job est de diminuer la puissance militaire de la junte au pouvoir par tout moyen à votre disposition.

"]];
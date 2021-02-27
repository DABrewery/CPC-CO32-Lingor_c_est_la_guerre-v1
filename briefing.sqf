/* Briefing au format sqf */


//Les objectifs
_t1 = player createSimpleTask["Steal technology, research Lab 101"];

_t1 setSimpleTaskDescription ["
<marker name='marker_objective_researchLab101'>Le laboratoire de recherche 101</marker> a permis de concevoir une technologie qui pourrait donner un avantage majeur à celui qui en disposera.<br/><br/>

Le laboratoire est protégé par une garnison relativement ettofée. Pour accéder à cette technologie, il vous faut hacker le PC se trouvant dans le laboratoire. Une fois cela fait, vous devriez pouvoir vous emparer et utiliser cette technologie<br/><br/>

Tous les personnels sont en mesure de procéder à la tentative de hacking (interaction ACE sur le PC)<br/><br/>

Essayez de ne pas tuer le scientifique présent, il pourrait vous donner des renseignements utiles",
"Steal techno - Lab 101", "Steal techno - Lab 101"
];

_t2 = player createSimpleTask["Steal technology, research Lab 102"];

_t2 setSimpleTaskDescription ["
<marker name='marker_objective_researchLab102'>Le laboratoire de recherche 102</marker> a permis de concevoir une technologie qui pourrait donner un avantage certain à celui qui en disposera.<br/><br/>

Le laboratoire est protégé par une petite garnison. Pour accéder à cette technologie, il vous faut hacker le PC se trouvant dans le laboratoire. Une fois cela fait, vous devriez pouvoir vous emparer et utiliser cette technologie<br/><br/>

Tous les personnels sont en mesure de procéder à la tentative de hacking (interaction ACE sur le PC).",
"Steal techno - Lab 102", "Steal techno - Lab 102"
];

_t3 = player createSimpleTask["Free the comrades"];

_t3 setSimpleTaskDescription ["
L'armée locale détient nos camarades dans <marker name='marker_objective_freeComrades'>une prison à l'écart des agglomérations</marker>. Nos camarades sont torturés et nous avons les pires craintes pour leur survie.<br/><br/>

Neutrlisez la garnison, puis libérez les camarades. Ils rejoindront aussi vite que possible une cache au milieu de la jungle. Lorsque le premier prisonnier aura rejoint la cache, il prendra contact avec le commandement des Picaros. Il est très probable qu'une opération de sabotage sera organisée pour fêter cela. Vous devriez en être informés si tout va bien.<br/><br/>

<font color='#ff8205'>Protocole de libération des prisonniers</font><br/>
Les collègues sont traumatisés par les mauvais traitements qu'ils ont subis depuis plusieurs semaines. Suivez précisément le protocole suivant pour assurer qu'ils seront en mesure de se débrouiller par eux-mêmes par la suite :<br/>
> Escortez chaque prisonnier à la sortie du batiment<br />
> Libérez le leader en premier (il a eu le droit de garder sa casquette)<br />
> Il ne partira pas de lui-même car il sera probablement encore très fragile : autorisez-le à prendre la poudre d'escampette (interaction ACE sur le prisonnier)<br />
> Libérez ensuite tous les picaros de son batiment, ils devraient le suivre sans problème.",
"Free the comrades", "Free the comrades"
];

_t4 = player createSimpleTask["Kill the High Value Target"];

_t4 setSimpleTaskDescription ["
Un officier supérieur russe se repose dans la <marker name='marker_objective_militaryHQ'>ville de Corazon</marker>.<br/><br/>

Eliminez-le, ainsi que sa garde rapprochée. On espère que sa disparition ralentira l'arrivée de renforts externes.",
"Kill the High Value Target", "Kill the High Value Target"
];

_t5 = player createSimpleTask["Neutralize anti-air support - Maruko"];

_t5 setSimpleTaskDescription ["
L'aéroport international de Maruko est l'infrastructure principale russe. Il leur permet de maintenir leur puisance militaire sur Lingor. L'aéroport est fortement défendu par :<br/>
> une garnison sur <marker name='marker_garn_Maruko'>le camp militaire</marker> contigü à l'aéroport<br/>
> un <marker name='marker_objective_MarukoAirport'>dispositif anti-aérien</marker> constitué d'une Shilka (ZSU-23-4V) et d'un poste de tir fixe Djigit (9k38 Igla)<br/>
> potentiellement, un Mi-24 ou un Su25, mais ceux-ci pourraient être en opération, on n'est donc pas sûrs de leur présence<br/>
> des patrouilles nombreuses sur la zone, essentiellement sur partie sud de l'aéroport<br/><br/>

Il parait peu probable que vous puissiez prendre le contrôle de ce point stratégique par vos propres moyens, sauf à disposer de moyens lourds. Néanmoins, neutraliser le dispositif anti-aérien sécurisera une partie importante de l'espace aérien et devrait vous permettre de disposer d'une maîtrise, au moins partielle, de la troisième dimension.<br/><br/>

Si, en plus, vous parvenez à hacker la tour de contrôle à proximité, vous serez en position forte pour prendre le contrôle de la zone (voir objectifs suivants).",
"Neutralize anti-air support - Maruko", "Neutralize anti-air support - Maruko"
];

_t6 = player createSimpleTask["Hack the radio station - Maruko"];

_t6 setSimpleTaskDescription ["
Une <marker name='marker_objective_radioStation_2'>station radio à proximité de l'aéroport international de Maruko</marker> permet les communications longues distance.<br/><br/>

Neutralisez la garde de la station radio et hackez le PC qui la contrôle (interaction ACE sur le PC). Le PC est faibement protégé et vous devriez pouvoir en venir à bout sans trop de difficultés.<br/><br/>

Cela vous permettra d'utiliser la station radio à vos propres fins, par exemple, en appelant les Marines pour un débarquement en force sur l'aéroport.<br/><br/>

Bien entendu, n'appelez ces renforts que si vous avez la maîtrise de l'air sur le nord de Lingor, sinon, ce sera une boucherie.",
"Hack the radio station - Maruko", "Hack the radio station - Maruko"
];

_t7 = player createSimpleTask["Neutralize anti-air support - Sargento"];

_t7 setSimpleTaskDescription ["
L'aéroport de Sargento est une infrastructure russe importante. Il leur permet notamment de contrôler l'espace aérien sur la partie sud de Lingor. L'aéroport est défendu par :<br/>
> une garnison sur <marker name='marker_garn_Sargento'>le camp militaire</marker> contigü à l'aéroport<br/>
> un <marker name='marker_objective_SargentoAirport'>dispositif anti-aérien</marker> constitué de deux ZU-23-2 à chaque extrémité de la piste<br/>
> potentiellement, un Mi-24 ou un Su25, mais ceux-ci pourraient être en opération, on n'est donc pas sûrs de leur présence<br/>
> quelques patrouilles sur la zone<br/><br/>

Il parait difficile que vous puissiez prendre le contrôle de ce point stratégique par vos propres moyens, sauf à disposer de moyens lourds. Néanmoins, neutraliser le dispositif anti-aérien sécurisera une partie importante de l'espace aérien et devrait vous permettre de disposer d'une maîtrise, au moins partielle, de la troisième dimension.<br/><br/>

Si, en plus, vous parvenez à hacker la tour de contrôle à proximité, vous serez en position forte pour prendre le contrôle de la zone (voir objectifs suivants).",
"Neutralize anti-air support - Sargento", "Neutralize anti-air support - Sargento"
];

_t8 = player createSimpleTask["Hack the radio station - Sargento"];

_t8 setSimpleTaskDescription ["
Une <marker name='marker_objective_radioStation_1'>station radio à proximité de l'aéroport de Sargento</marker> permet les communications longues distance.<br/><br/>

Neutralisez la garde de la station radio et hackez le PC qui la contrôle (interaction ACE sur le PC). Le PC est faibement protégé et vous devriez pouvoir en venir à bout sans trop de difficultés.<br/><br/>

Cela vous permettra d'utiliser la station radio à vos propres fins, par exemple, en appelant les Marines pour un débarquement en force sur l'aéroport.<br/><br/>

Bien entendu, n'appelez ces renforts que si vous avez la maîtrise de l'air sur le nord de Lingor, sinon, ce sera une boucherie.",
"Hack the radio station - Sargento", "Hack the radio station - Sargento"
];

_t9 = player createSimpleTask["Destroy the ammunition depot - Vidora"];

_t9 setSimpleTaskDescription ["
Le <marker name='marker_objective_CampMarpaso'>petit camp de Marpaso</marker> contient un important dépôt de munitions.<br/><br/>

Neutralisez la garnison et faites pêter le dépôt. Vous pouvez vous servir avant<br/><br/>

Ah, juste un conseil : les munitions, ça explose facilement. Faites en sorte que le déclenchement du feu d'artifice soit volontaire et sécurisé...",
"Destroy the ammunition depot - Vidora", "Destroy the ammunition depot - Vidora"
];

_t10 = player createSimpleTask["Destroy the ammunition depot - Oeste Harbor"];

_t10 setSimpleTaskDescription ["
Le <marker name='marker_objective_OesteHarbor'>petit camp de Oeste Harbor</marker> contient un important dépôt de munitions.<br/><br/>

Neutralisez la garnison et faites pêter le dépôt. Vous pouvez vous servir avant<br/><br/>

Ah, juste un conseil : les munitions, ça explose facilement. Faites en sorte que le déclenchement du feu d'artifice soit volontaire et sécurisé...",
"Destroy the ammunition depot - Oeste Harbor", "Destroy the ammunition depot - Oeste Harbor"
];

//Crédits
player createDiaryRecord ["Diary", ["Crédits", "

<font color='#ff0505'>Lingor : c'est la guerre</font color><br/><br/>

Auteur : tanin69<br/><br/>

<font color='#ff9605'>Merci à Mystery, Sparfell, Shinriel pour les bibliothèques de GDC_Lib https://github.com/GdC-Framework/GdC_lib/<br/>
> Re-merci à Shinriel pour les scripts déments de super pouvoirs<br/>
> Merci à [GIE] Gavin 'Morbakos' Sertix pour plusieurs scripts intégrés en routine dans mes missions</font color><br/><br/>

<font color='#82ff05'>Remerciements spéciaux à</font color><br/>
> Bruno (aka SBS) pour l'inspiration initiale : parce que oui, c'est une mission pensée d'abord pour une seconde partie de soirée (et les secondes parties de soirée avec Bruno, c'est juste vraiment bien)<br/>
> Mystery (vache sacrée) parce qu'il est toujours là, même s'il se fait chier pendant 90% des parties. Il m'a poussé à introduire de la SURPRISE dans cette mission (et les autres), mais on verra à l'usage si c'est réussi<br/>
> Sparfell (autre vache sacrée) parce que les mythiques cache-cash m'ont donné envie de faire une mission à longue durée de vie... Différente<br/><br/>

<font color='#ff0505'>Remerciements éternels</font color><br/>
> A tous les canards, vous savez bien pourquoi !<br/>
> A ma femme qui ne m'a pas encore pas quitté, je ne sais toujours pas pourquoi (en dehors de mes talents sexuels exceptionnels, mais ça n'explique quand même pas tout)<br/><br/>

Release notes : https://github.com/DABrewery/CPC-CO15-Lingor_c_est_la_guerre-v1

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

A proximité de vos campements (<marker name='marker_camp_North'>au nord</marker>, à <marker name='marker_camp_West'>l'ouest</marker> et au <marker name='marker_camp_South'>sud est</marker>), vous disposez de 3 zones à partir desquelles vous pouvez appeler VTOL pour vous faire larguer du réappro.<br/>
Vous pouvez vous faire larguer le stuff n'importe où... Mais attention : si l'appareil de réappro est endommagé ou détruit, vous ne pourrez plus appeler le VTOL à partir de cette zone.<br/>
Dans sa grande bonté, outre des munitions en quantité illimitée, l'armée US peut vous larguer :<br/>
> Un camion tactique de type M1078 non armé pouvant transporter au moins 16 personnels, ainsi que des caisses de matériel<br/>
> Un camion tactique de type M1078 armé d'une M1, avec la même capacité d'emport de personnel et de matériel<br/>
> Un véhicule tout terrain non armé MRZR 4<br/><br/>

<font color='#ff8205'>Seuls les MARSOC équipés d'une PRC-148 sont en mesure de demander du réappro !</font color> (SSS - interaction ACE sur vous-même)<br/><br/>

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
> Les Picaros (et uniquement eux) peuvent opérer tous les équipements récupérés: blindés lourds ou légers, aéronefs... Seules les compétences disponibles dans l'équipe limitent leurs possibilités.<br/><br/>

<font color='#ff8205'>MARSOC</font color><br/>
Ben, ce sont des MARSOC. Ils sont bien équipés, mais clairement plutôt pour l'assaut. Ils ne disposent pas de moyens AA et n'ont que le minimum en AT.<br/><br/>

<font color='#ff8205'>Picaros</font color><br/>
Armement de type russe. Pas de protection balistique parce que les chefs Picaros disent que c'est pour les tafioles. Même s'il est censé bien connaitre le terrain, le CdO Picaros a quand même réussi à négocier un micro-DAGR auprès des MARSOC. En plus d'une équipe d'assaut courageuse, les Picaros peuvent engager :<br/>
> Une PKP amoureusement entretenue<br/>
> Du snipper (VDV + M145 MGO)<br/>
> Du grenadier (GP-25 bien stuffé)<br/>
> De l'AA (Igla)<br/>
> De l'AT (RPG-7 + PGO)<br/><br/>

<font color='#ff8205'>Caisses</font color><br/>
Vous avez pu emmener avec vous 3 caisses de matos jusqu'à votre point d'insertion :<br/>
> Du matos US avec de l'équipement pour OP nocturne et deux trois babioles, dont des radios LP et CP supplémentaires, mais surtout un drone Raven<br/>
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
player createDiaryRecord ["Diary", ["Objectifs", "

10 objectifs au choix, chaque objectif constituant en lui-même une mission. Pour le détail de chaque objectif, consultez l'onglet 'Taches'.<br /><br />

(cliquez sur le titre de l'objectif)<br/><br/>

<font color='#ff0505'><marker name='marker_objective_researchLab101'>Steal technology, research Lab 101</marker></font color><br/>
Si réussite : vous procure un avantage technologique majeur, après hacking difficile d'un système.<br/><br/>

<font color='#ff0505'><marker name='marker_objective_researchLab102'>Steal technology, research Lab 102</marker></font color><br/>
Si réussite : vous procure un avantage technologique important, après hacking difficile d'un système.<br/><br/>

<font color='#ff0505'><marker name='marker_objective_freeComrades'>Free the comrades</marker></font color><br/>
Si réussite : une opération de sabotage est déclenchée par les Picaros si au moins un prisonnier rejoint la cache dans la jungle.<br/><br/>

<font color='#ff0505'><marker name='marker_objective_militaryHQ'>Kill the High Value Target</marker></font color><br/>
Si réussite : les renforts extérieurs ont moins de chances d'arriver.<br/><br/>

<font color='#ff0505'>Neutralize anti-air support : <marker name='marker_objective_MarukoAirport'>Maruko </marker> ou <marker name='marker_objective_SargentoAirport'>Sargento</marker></marker></font color> (Dangerous Baby !!)<br/>
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
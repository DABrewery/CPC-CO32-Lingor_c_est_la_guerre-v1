# Mission à objectifs multiples

## Principes de jeu

10 objectifs au choix, chaque objectif constituant en lui-même une mission.

La mission peut aussi bien être jouée en petit effectif qu'en grand effectif : adaptation du nombre d'hostiles par rapport au nombre de joueurs (et d'IA si l'envie vous en prend).

Le nombre d'objectifs et leur ordre est au choix du commandant d'opération. Bien entendu, la situation stratégique peut guider les choix, certains étant évidents, d'autres moins.

## Factions joueurs

Une équipe US MARSOC

Une équipe type "PICAROS"

Avantage majeur : un drone RAVEN

## Changelog

### v3, 06/03/2021
* Correction de la durée du sleep de la boucle de paradrop, restée à 10 s. pour une raison mal définie

### v3, 28/02/2021

* Logistique : correction de la logistique SSS sur la zone sud qui n'avait pas la bonne liste de stuff
* Logistique : ajout de munitions IGLA supplémentaires dans la caisse Picaros au spawn
* Renforts extérieurs : le délai des premiers renforts ne coure qu'à partir de la détection d'un joueur par les ENI
* Renforts extérieurs : les paras ne sautent pas directement sur les joueurs, sauf malchance
* Renforts extérieurs : certains renforts ne sont appelés que si au moins un groupe d'hostile a connaissance d'un joueur (knowsAbout > 0)
* Objectifs : amélioration de la prise en compte du kill de l'HVT

### v2, 27/02/2021

Première release

## Backlog

### Prévu

* Intégrer le système de respawn custom
* Ajouter des patrouilles aléatoires dans certaines villes
* Correction du bug des projecteurs qui ne tournent pas (semble être un bug Arma)
* Correction du bug de wp qui s'ajoutent à l'infini avec lucyGroupRandomPatrol (bug arma confirmé)
* Nettoyage / refactoring propre de plusieurs fonctions : spawnMeca.sqf et spawnParadrop.sqf en particulier
* Meilleure intégration des Shinriel's super power (cf. fn_activatePowerWithObject.sqf)

### Idées en vrac

* Gérer le fade out lors du changement de temps
* Rendre possible le drop SSS en dehors des zones prévues, avec bonus de temps si dépôt de mun
* Gérer la condition du air drop par rapport à la zone à partir de la zone où l'on se trouve
* Sinon mettre la condition d'appel SSS à un objet sur la zone

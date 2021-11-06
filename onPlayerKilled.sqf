private _music = selectRandom ["EventTrack02_F_Curator","EventTrack03_F_Curator","EventTrack02_F_Orange","EventTrack02a_F_EPB"];

playMusic _music;

//disable radios
[true] call acre_api_fnc_setSpectator;

//Visual transition before lauching spectator view
[0,"BLACK",3, 1] call BIS_fnc_fadeEffect; 
uiSleep 10;
[1,"BLACK",3] call BIS_fnc_fadeEffect;

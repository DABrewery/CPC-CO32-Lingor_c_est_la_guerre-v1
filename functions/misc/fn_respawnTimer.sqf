/* allow respawn each RESPAWN_DELAY intervals */

params [
	"_respawnDelay"
];

waitUntil {time >= _respawnDelay};
dispoRsp = true;
publicVariable "dispoRsp";

for "_i" from 1 to 5 do {
	["Le respawn est disponible !"] remoteExec ["systemChat"];
	sleep 5;
};


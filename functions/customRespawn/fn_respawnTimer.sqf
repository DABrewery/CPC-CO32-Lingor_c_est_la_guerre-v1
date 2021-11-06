/* 
- allow regroup/respawn each respawn_delay intervals
- Publish to a public variable delay before next respawn/regroup time
*/

params [
	"_respawnDelay"
];

delayBeforeRegroup = 0;

while {time <= _respawnDelay} do {
	delayBeforeRegroup = _respawnDelay - time;
	publicVariable "delayBeforeRegroup";
	//systemChat str (floor (delayBeforeRegroup/60));
	sleep 5;
};

dispoRsp = true;
publicVariable "dispoRsp";

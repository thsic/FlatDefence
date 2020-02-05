///敵hpを全部合わせたもの計測
for(var i=0; i<SPAWN_ENEMY_TYPE_AMOUNT; i++){
	if(global.spawn_enemy[i, spawnenemy.objectid] != -1){
		var enemy_objectid = i;
		var enemy_amount = global.spawn_enemy[enemy_objectid, spawnenemy.amount];
		var enemy_number = global.spawn_enemy[enemy_objectid, spawnenemy.number];
		global.all_enemy_total_hp += global.enemydata[enemy_number, enemydata.hp]*enemy_amount;
	}
}



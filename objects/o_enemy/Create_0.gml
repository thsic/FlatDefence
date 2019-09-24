for(var i=0; i<global.enemy_category_amount; i++){//データから自分を探す
	if(global.enemydata[i, enemydata.object] = object_index){
		enemy_number = i;
		break
	}
}

hp_max = global.enemydata[enemy_number, enemydata.hp];
speed = global.enemydata[enemy_number, enemydata.speed];
shield = global.enemydata[enemy_number, enemydata.shield];
name = global.enemydata[enemy_number, enemydata.name]
hp = hp_max; 
direction = 0;
destroy_enemy = false;
speed_temp = -1;

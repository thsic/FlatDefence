///@param dotdamage

var dot_damage = argument0;
var timing = 30

if(chronomancer_timing <= 0){
	for(var i=0; i<global.enemy_amount; i++){
		var target_id = global.enemy_id[i];
		var target_x = global.enemy_id[i].x;
		var target_y = global.enemy_id[i].y;
		if(point_distance(x, y, target_x, target_y) <= range){
			slow_to_enemy(target_id, 1, timing/2);
		}
	}
	chronomancer_timing = timing;
}
else{
	chronomancer_timing--;
}
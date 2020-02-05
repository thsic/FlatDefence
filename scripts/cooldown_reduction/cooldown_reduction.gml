///@param object_id,percent,level

var object_id = argument0;
var percent = 1-argument1;
var level = argument2;
var cooldown_time_max = FPS_DEFAULT / object_id.attack_per_second;
var reduction_percent = 1;
repeat(level){
	reduction_percent *= percent;
}

object_id.cooldown -= cooldown_time_max*(1-reduction_percent);
if(object_id.cooldown < 0){
	object_id.cooldown = 0;
}
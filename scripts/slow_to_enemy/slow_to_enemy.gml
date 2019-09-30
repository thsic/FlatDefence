///@param enemy_id,freezeLV,damage
var enemy_id = argument0;
var freeze_level = argument1;
var freeze_time = argument2*2;

var freeze_point1 = enemy_id.freeze_time*enemy_id.freeze_lv;
var freeze_point2 = freeze_time*freeze_level;
if(freeze_point1 < freeze_point2){//フリーズポイントを比較して大きい方を優先
	enemy_id.freeze_time = freeze_time;
	enemy_id.freeze_lv = freeze_level;
}

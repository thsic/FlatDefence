///@param damage,target_id,effect
//敵にダメージを与える
var damage = argument0;
var target_id = argument1;
var effect = argument2;//追加効果

target_id.hp -= damage;
if(target_id.hp <= 0){
	target_id.destroy_enemy = true;
}

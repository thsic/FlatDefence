///@param damage,target_id,effect
//敵にダメージを与える
var damage = argument0;
var target_id = argument1;
var effect = argument2;//追加効果

if(target_id.shield > 0){//シールド削り
	target_id.shield -= 1
}
if(damage/10 > damage - target_id.shield){
	target_id.hp -= damage/10;//攻撃力の1/10は最低保障ダメージ
}
else{
	target_id.hp -= damage - target_id.shield;
}

if(target_id.hp <= 0){
	target_id.destroy_enemy = true;
}

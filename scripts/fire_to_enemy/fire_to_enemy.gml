///@param target_id,speed,bullet,damage,defenderid
var target_id = argument0;
var b_speed = argument1;
var create_bullet = argument2;
var bullet_damage = argument3;
var d_id = argument4

if(instance_exists(target_id)){//なんかエラーが起きることがあるので存在チェック
	with(instance_create_layer(x, y, "Bullet", create_bullet)){
		bullet_speed = b_speed;
		direction = point_direction(x, y, target_id.x, target_id.y);
		bullet_target = target_id;
		damage = bullet_damage;
		defender_id = d_id
	}
}

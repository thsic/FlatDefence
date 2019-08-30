///@param target_id,speed,bullet
var target_id = argument0;
var bullet_speed = argument1;
var create_bullet = argument2;
if(instance_exists(target_id)){//なんかエラーが起きることがあるので存在チェック
	with(instance_create_layer(x, y, "Bullet", create_bullet)){
		speed = bullet_speed;
		direction = point_direction(x, y, target_id.x, target_id.y);
		bullet_target = target_id;
	}
}

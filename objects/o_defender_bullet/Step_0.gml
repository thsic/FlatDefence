//数fごとに角度を変える
--direction_change_cooldown;
if(direction_change_cooldown >= 0){
	if(instance_exists(bullet_target)){//存在チェック
		direction = point_direction(x, y, bullet_target.x, bullet_target.y);
		direction_change_cooldown = direction_change_cooldown_default;
	}
	else{
		instance_destroy();//ターゲットが存在しないので消滅
	}
}

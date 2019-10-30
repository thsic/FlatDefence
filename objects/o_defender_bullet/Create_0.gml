direction_change_cooldown = direction_change_cooldown_default;
speed_temp = -1;
destroy_countdown = -1;//0になると死
bullet_speed = 1;//弾の速度
destroy_countdown_default = 10;
fire_interval_now = 0


for(var i=0; i<IMPERIALLANCE_PENETRATION_MAX; i++){
	penetration_enemy_id[i] = -1//インペリアルランス持った時用
}

dirprev = direction
xprev = x;
yprev = y;
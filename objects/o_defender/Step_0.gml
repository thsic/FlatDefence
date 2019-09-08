
#region item
var fire_damage_temp = 0;
var attack_per_second_temp = 0;
var range_temp = 0;
for(var i=0; i<global.item_category_amount; i++){
	if(equipped_item[i]){//装備確認
		fire_damage_temp += global.itemdata[i, itemdata.damage];
		attack_per_second_temp += global.itemdata[i, itemdata.attack_speed];
		range_temp += global.itemdata[i, itemdata.range];
	}
}
fire_damage = fire_damage_temp + fire_damage_default;
attack_per_second = attack_per_second_temp + attack_per_second_default;
range = range_temp + range_default;

#endregion

#region State
switch(state){
#region 攻撃クールダウン
case state.decrement_cooldown:
	--cooldown;
	if(cooldown <= 0){
		find_enemy_id = find_enemy();//敵idが返ってくる
		if(find_enemy_id != false){//射程内に敵がいるか確認 
			state = state.fire;//いる 攻撃
		}
		else{
			state = state.idle;//居ないので待つ
		}
	}
break
#endregion

#region 攻撃できるけど射程内に敵がいない
case state.idle:
	find_enemy_id = find_enemy();
	if(find_enemy_id != false){
		state = state.fire;
	}
break
#endregion

#region 攻撃の実行
case state.fire:
	if(select_type != NEARGOAL){//NEARGOALの場合はfind_enemyで見つけた敵idがそのまま使える
		target_id = select_enemy(select_type);//敵を選択
	}
	else{
		target_id = find_enemy_id;
	}
	fire_to_enemy(target_id, bullet_speed, o_defender_bullet, fire_damage);
	set_cooldown();
	state = state.decrement_cooldown;
break
#endregion

}
#endregion


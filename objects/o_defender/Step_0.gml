#region item 
//アイテムだけはステータスウィンドウに反映するためにポーズ中以外でも動く
var fire_damage_temp = 0;
var attack_per_second_temp = 0;
var range_temp = 0;

//装備確認
for(var i=0; i<itemslot_amount; i++){
	if(itemslot[i] != -1){
		fire_damage_temp += global.itemdata[itemslot[i], itemdata.damage];
		attack_per_second_temp += global.itemdata[itemslot[i], itemdata.attack_speed];
		range_temp += global.itemdata[itemslot[i], itemdata.range];
	}
}
//ステータス上昇
fire_damage = fire_damage_temp + fire_damage_default;
attack_per_second = attack_per_second_temp + attack_per_second_default;
range = range_temp + range_default;

#endregion

#region effect
var attack_speed_halve = 0;
var true_basic = 0;
var range_halve = 0;
var attack_halve = 0;
var attack_halve_disempower = 0;
for(var i=0; i<EFFECT_SLOT_MAX; i++){
	if(effect_now[i, effectnow.number] != -1){
		//何かしらのエフェクトがある
		switch(effect_now[i, effectnow.number]){
		case 8://as半減
			attack_speed_halve++;
		break
		case 9://全エフェクトを無効化する
			true_basic++;
		break
		case 10:
			range_halve++;
		break
		case 11:
			attack_halve++
		break
		case 13:
			attack_halve_disempower++;
		break
		
		}
	}
	else{
		break
	}
}

if(attack_speed_halve){
	attack_per_second *= 0.5;
}
if(range_halve){
	range *= 0.5;
}
if(attack_halve_disempower){
	for(var i=0; i<EFFECT_SLOT_MAX; i++){
		if(effect_now[i, effectnow.number] = -1){
			break
		}
		else if(effect_now[i, effectnow.number] = 11){//攻撃半減を消す
			effect_now[i, effectnow.number] = -1;
			effect_sort(id);
		}
	}
}
if(attack_halve){
	fire_damage *= 0.5;
}


if(true_basic){
	for(var i=0; i<EFFECT_SLOT_MAX; i++){
		if(effect_now[i, effectnow.number] != 9){//true basic以外を消す
			effect_now[i, effectnow.number] = -1;
			effect_now[i, effectnow.time] = -2;
		}
	}
	effect_sort(id);//ソート
}
//切り上げ
fire_damage = ceil(fire_damage);
range = ceil(range);


//エフェクト効果時間関連
for(var i=0; i<EFFECT_SLOT_MAX; i++){
	if(effect_now[i, effectnow.number] != -1 and effect_now[i, effectnow.time] != -1){
		if(effect_now[i, effectnow.time] > 0){
			effect_now[i, effectnow.time]--;//エフェクト効果時間減らす
		}
		else{
			//エフェクト効果時間が切れた
			effect_now[i, effectnow.number] = -1;
			effect_now[i, effectnow.time] = -2;
			effect_sort(id)
		}
	}
}

#endregion
if(global.gamestate = gamestate.main){
	#region skill
	enum skillstate{
		cooldown,
		up,
		active
	}
	if(skill_id != -1){//スキルが装備されている場合
		switch(skill_state){
		case skillstate.cooldown:
			skill_state = skillstate.cooldown
			skill_cooldown--;
			if(skill_cooldown <= 0){
				skill_state = skillstate.up//スキル使用可能
			}
		break
		case skillstate.up:
			if(mouse_check_button(mb_right)){
				if(x-sprite_width/2 < mouse_x and mouse_x < x+sprite_width/2){
					if(y-sprite_height/2 < mouse_y and mouse_y < y+sprite_height/2){
						//スプライトの上で右クリックされたらスキル発動
						use_skill();
					}
				}
			}
		break
		case skillstate.active:
			//スキル使用中
			skill_active()
		break
		}
	}
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
		fire_to_enemy(target_id, bullet_speed, o_defender_bullet, fire_damage, id);
		set_cooldown();
		state = state.decrement_cooldown;
	break
	#endregion

	}
	#endregion

}
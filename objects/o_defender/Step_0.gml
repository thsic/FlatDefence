#region item 
//アイテムだけはステータスウィンドウに反映するためにポーズ中以外でも動く
var fire_damage_temp = 0;
var attack_per_second_temp = 0;
var range_temp = 0;
var item_amount = 0
//装備確認
for(var i=0; i<itemslot_amount; i++){
	if(itemslot[i] != -1){
		fire_damage_temp += global.itemdata[itemslot[i], itemdata.damage];
		attack_per_second_temp += global.itemdata[itemslot[i], itemdata.attack_speed];
		range_temp += global.itemdata[itemslot[i], itemdata.range];
		item_amount++;
	}
}
//ステータス上昇
fire_damage = fire_damage_temp + fire_damage_default;
attack_per_second = attack_per_second_temp + attack_per_second_default;
range = range_temp + range_default;
//アイテム装備時の小さいエフェクト
item_equipped_particle(x, y, item_amount, 16, 10, 4);

#endregion

#region effect
var demons_fire_level = 0;
var attack_speed_halve = 0;
var true_basic = 0;
var range_halve = 0;
var attack_halve = 0;
var attack_halve_disempower = 0;
var itemslot_plus = 0;
var range_x2 = 0;
var chronomancer = 0;
var strong_blaster = 0;
var triple_shot = 0;
var basicist = 0;
var freeze_dot_damage = 0;
var septuple_shot = 0

for(var i=0; i<EFFECT_SLOT_MAX; i++){
	if(effect_now[i, effectnow.number] != -1){
		//何かしらのエフェクトがある
		switch(effect_now[i, effectnow.number]){
		case 3:
			demons_fire_level++;
		break
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
		case 13://攻撃半減無効
			attack_halve_disempower++;
		break
		case 15://アイテム枠+2
			itemslot_plus++;
		break
		case 16://射程2倍
			range_x2++;
		break
		case 18://射程内全員スロー 処理はかなりしたのほうに
			chronomancer++;
		break
		case 19://連射速度と弾速上昇
			strong_blaster++;
		break
		case 21://3連続攻撃
			triple_shot++;
		break
		case 24://装備するbasicswordを全てアップグレードする
			basicist++;
		break
		case 27:
			freeze_dot_damage++;
		break
		case 28://7連攻撃
			septuple_shot++;
		break
		}
	}
	else{
		break
	}
}

//まずステータス減少系
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
if(range_x2){
	for(var i=0; i<range_x2; i++){
		range *= 2;
	}
}


//
if(itemslot_plus){
	itemslot_amount = global.defender_data[defender_number, data.itemslot]+2;
}
if(strong_blaster){
	bullet_speed = 30;
}
if(basicist){
	for(var i=0; i<itemslot_amount; i++){
		if(itemslot[i] = 1){//basicsword 探す
			itemslot[i] = 2;
			true_basic = true;
			for(var j=0; j<EFFECT_SLOT_MAX; j++){//true basic付与
				if(effect_now[j, effectnow.number] = -1){
					effect_now[j, effectnow.number] = 9;
					effect_now[j, effectnow.time] = -1;
				}
			}
		}
	}
}

//最後にtruebasic
if(true_basic){
	for(var i=0; i<EFFECT_SLOT_MAX; i++){//true basic Itemslot+2 Basicist以外を消す
		if(effect_now[i, effectnow.number] != 9 and effect_now[i, effectnow.number] != 15 and effect_now[i, effectnow.number] != 24){
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
			skill_active_effect(x, y, 16, 10, 1);
		break
		}
	}
	#endregion

	#region State
	switch(state){
	#region 攻撃クールダウン
	case state.decrement_cooldown:
		if(cooldown <= 0){
			find_enemy_id = find_enemy();//敵idが返ってくる
			if(find_enemy_id != false){//射程内に敵がいるか確認 
				state = state.fire;//いる 攻撃
			}
			else{
				state = state.idle;//居ないので待つ
			}
		}
		else{
			--cooldown;
			if(triple_shot){
				if(remaining_bullets > 0){
					if(blaster_shot_cooldown <= 0){
						fire_to_enemy(target_id, bullet_speed, o_defender_bullet, fire_damage, id);
						remaining_bullets--;
						if(strong_blaster){
							blaster_shot_cooldown = BLASTER_SHOT_COOLDOWN_UPGRADE;
						}
						else{
							blaster_shot_cooldown = BLASTER_SHOT_COOLDOWN;
						}
					}
					else{
						blaster_shot_cooldown--;
					}
				}
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
		if(triple_shot){
			if(septuple_shot){//7連攻撃
				remaining_bullets = global.effectdata[28, effectdata.value]-1
			}
			else{
				remaining_bullets = global.effectdata[21, effectdata.value]-1
			}
			
			if(strong_blaster){
				blaster_shot_cooldown = BLASTER_SHOT_COOLDOWN_UPGRADE;
			}
			else{
				blaster_shot_cooldown = BLASTER_SHOT_COOLDOWN;
			}
		}
		state = state.decrement_cooldown;
	break
	#endregion

	}
	#endregion

	#region chronomancer
	if(chronomancer){
		if(freeze_dot_damage){
			chronomancer_slow(true, demons_fire_level);
		}
		else{
			chronomancer_slow(false, 0);
		}
		
	}
	#endregion

}
///@param damage,target_id,defenderid
//敵にダメージを与える
var basedamage = argument0;
var target_id = argument1;
var defender_id = argument2;
var damage = basedamage;//元々のダメージ 爆風やインペリアルランスのダメージに使う
var defender_fire_damage = defender_id.fire_damage//defenderの攻撃力 スローとかに
var damage_result = 0;

var fire_level = 0;
var ice_level = 0;
var blast_level = 0;
var demons_fire_level = 0;
var cooldown_reduction_40 = 0;
var cursed = 0;
var penetration = 0;
var penetration_plus = 0;
var freeze_all = 0;
var shield_break = 0;
var blast_damageup = 0;
var gold_get_plus = 0;
var gold_get = 0;
var one_shot_one_kill = 0;
var one_shot_one_kill_plus = 0;
var blast_onhit_effect = 0;
var gold_ammo = 0;
var odd_add_damage = 0;
var hpmax_add_damage = 0;
var hpmax_add_damage_plus = 0;

var demons_fire_count = 0;//悪魔の炎発動回数 最後に貫通ダメージとして加算する

//最初にエフェクトを確認しておく
for(var i=0; i<EFFECT_SLOT_MAX; i++){
	if(defender_id.effect_now[i, effectnow.number] != -1){
		//何かしらのエフェクトがある
		switch(defender_id.effect_now[i, effectnow.number]){
		case 0:	
			blast_level++;//攻撃時爆風発生
		break
		case 1:
			fire_level++;//貫通
		break
		case 2:
			ice_level++;//スロー +1されてるのはLV1は範囲スローで使ってるから
		break
		case 3:
			demons_fire_level++;//悪魔の炎
		break
		case 4:
			cooldown_reduction_40++;//撃破時クールダウン40%解消
		break
		case 5:
			cursed++;//スキル時以外攻撃不可
		break
		case 6:
			penetration++;//貫通攻撃
		break
		case 7:
			penetration_plus++;//貫通攻撃アップグレード
		break
		case 12:
			freeze_all++;//あらゆる攻撃でスローに
		break
		case 14:
			shield_break++;//シールド破壊値+3
		break
		case 17:
			blast_damageup++;//範囲攻撃中心だけダメージup
		break
		case 20:
			gold_get_plus++;//敵撃破ゴールド1.2倍
		break
		case 22:
			gold_get++;//敵撃破時ゴールド+3G
		break
		case 23:
			one_shot_one_kill++;//射程150以上の敵に攻撃した時ダメージ1.5倍
		break
		case 25:
			one_shot_one_kill_plus++;//射程250以上の敵に攻撃した時ダメージ2倍
		break
		case 26:
			blast_onhit_effect++;//爆風の中心はonhitになる
		break
		case 29:
			gold_ammo++;//お金を1%消費して消費したゴールド*10の追加ダメージ
		break
		case 30:
			odd_add_damage++;//敵のHPが奇数の場合は追加ダメージ
		break
		case 31:
			hpmax_add_damage++;//敵のhpが最大の場合追加ダメージ
		break
		case 32:
			hpmax_add_damage_plus++;//敵のHPが最大の場合もっと追加ダメージ
		break
		}
	}
	else{
		break
	}
}

if(cursed != 0){
	if(defender_id.skill_state != skillstate.active){
		damage *= CURSEDSWORD_MAGNIFICATION;//呪われているのでダメージ0.1倍
		basedamage *= CURSEDSWORD_MAGNIFICATION//例外でこれだけはbasedamageにも効果がある
	}
}

//スナイパーの固有エフェクト
if(one_shot_one_kill){
	if(point_distance(defender_id.x, defender_id.y, target_id.x, target_id.y) >= 150){
		damage *= global.effectdata[23, effectdata.value];
	}
}
if(one_shot_one_kill_plus){
	if(point_distance(defender_id.x, defender_id.y, target_id.x, target_id.y) >= 250){
		damage *= global.effectdata[25, effectdata.value];
	}
}

//敵HPが奇数なら追加ダメージ インペリアルランスの通過した敵には追加効果が発生しない
if(odd_add_damage and target_id = bullet_target){
	if(instance_exists(target_id)){
		repeat(odd_add_damage){
			if(target_id.hp mod 2 = 1){//奇数判定
				damage += defender_fire_damage * POISONDAGGER_MAGNIFICATION
			}
			demons_fire_count++;
		}
	}
}

//敵HPがMAXなら追加ダメージ インペリアルランスの通過した敵には追加効果が発生しない
if(hpmax_add_damage or hpmax_add_damage_plus){
	if(instance_exists(target_id) and target_id = bullet_target){
		if(target_id.hp = target_id.hp_max){
			if(hpmax_add_damage){
				damage += defender_fire_damage * global.effectdata[31, effectdata.value];
				
			}
			else if(hpmax_add_damage_plus){
				damage += defender_fire_damage * global.effectdata[32, effectdata.value];
			}
			demons_fire_count++;
		}
	}
}

//金の弾丸
if(gold_ammo){
	if(instance_exists(target_id)){
		if(global.gold > 100){//お金が100g以下なら発動しない
			var consume_gold = floor(global.gold/100);
			consumed_gold(consume_gold);
			damage += consume_gold*global.effectdata[29, effectdata.value]
		}
		demons_fire_count++;//100g以下でも悪魔の炎の効果は発動する
	}
}


if(fire_level = 0){
	//通常
	if(instance_exists(target_id)){
		if(target_id.shield > 0){//シールド削り
			if(shield_break > 0){//シールドブレイクがあるなら追加で削る
				for(var i=0; i<shield_break; i++){
					target_id.shield -= global.effectdata[14, effectdata.value];
				}
				if(target_id.shield <= SHIELD_BREAK_STRENGTH){
					target_id.shield = SHIELD_BREAK_STRENGTH;//あとで1削られるので1だけ残す
				}
			}
			target_id.shield -= SHIELD_BREAK_STRENGTH;
		}
		if(damage/10 > damage - target_id.shield){
			var damage_result = ceil(damage/10);//攻撃力の1/10は最低保障ダメージ
		}
		else{
			var damage_result = ceil(damage - target_id.shield);
		}
	}
}
else{
	//炎属性
	var damage_result = damage;
}
if(ice_level > 0){//スローをかける
	if(penetration or penetration_plus){
		//貫通攻撃の場合
		if(target_id = bullet_target){//攻撃対象に当たらないとスローにならない
			slow_to_enemy(target_id, ice_level+1, defender_fire_damage);
		}
		else if(freeze_all){//強化ロッドなら全部スローになる
			slow_to_enemy(target_id, ice_level+1, defender_fire_damage);
		}
	}
	else{
		//普通
		slow_to_enemy(target_id, ice_level+1, defender_fire_damage);
	}
}
if(demons_fire_level > 0){//悪魔の炎を持っているなら最終ダメージを上げる
	demons_fire_count++;
	damage_result += demons_fire_level*global.effectdata[3, effectdata.value]*demons_fire_count;
}
damage_result = ceil(damage_result)//ダメージ切り上げ

//最終的なダメージ
if(instance_exists(target_id)){
	play_se(SE_ENEMY_HIT_BULLET, 30, 0.2, true);
	target_id.hp -= damage_result;
	var break_effect_color = global.enemydata[target_id.enemy_number, enemydata.color];
	enemy_break_effect(target_id.x, target_id.y, 3, break_effect_color, 10, 4, 3.5, -1);
	//ダメージ記録
	if(target_id.hp <= 0){
		record_damage(defender_id, damage_result+target_id.hp);//敵を倒した場合
	}
	else{
		record_damage(defender_id, damage_result);
	}
	
	draw_damage_value(target_id.x, target_id.y, damage_result);
	
	if(target_id.hp <= 0){//敵が死んだ
		global.enemy_last_dead_position_x = target_id.x;
		global.enemy_last_dead_position_y = target_id.y;
		
		target_id.destroy_enemy = true;
		global.gold += global.enemydata[enemy_id_conversion(target_id.object_index), enemydata.dropgold]//ゴールドを落とす
	
		if(gold_get){//ゴールドゲットあるならそれも
			global.gold += global.effectdata[22, effectdata.value]
		}
		if(gold_get_plus){
			var get_gold = global.enemydata[enemy_id_conversion(target_id.object_index), enemydata.dropgold]+global.effectdata[22, effectdata.value]
			global.gold += ceil(get_gold*global.effectdata[20, effectdata.value]);
		}
	
		if(cooldown_reduction_40 != 0){//撃破時クールダウン短縮があるなら
			if(penetration or penetration_plus){
				//貫通攻撃がついている場合は狙った対象が死んだ場合のみcd短縮が発動
				if(target_id = bullet_target){
					cooldown_reduction(defender_id, global.effectdata[4, effectdata.value], cooldown_reduction_40);
				}
			}
			else{
				//普通
				cooldown_reduction(defender_id, global.effectdata[4, effectdata.value], cooldown_reduction_40);
			}
		}
	}

	if(blast_level > 0){
		//範囲攻撃
		var blast_power = 2
		for(var i=0; i<blast_level; i++){
			blast_power *= 1.5;
		}
		blast_power -= 1;
		var blast_alpha = 1;
		for(var i=0; i<blast_level-1; i++){
			blast_alpha *= 0.8;
		}
		
		blast_effect(target_id.x, target_id.y, blast_power*EFFECT_BLAST_SIZE, c_red, 10+blast_level*1, blast_alpha);
		for(var i=0; i<global.enemy_amount; i++){
			var enemy_id = global.enemy_id[i]
			if(instance_exists(enemy_id)){
				if(point_distance(target_id.x, target_id.y, enemy_id.x, enemy_id.y) < EFFECT_BLAST_SIZE*blast_power){
				
					damage_result = basedamage*BLAST_MAGNIFICATION;//爆風ダメージは減少する 現在0.25倍
					if(freeze_all){//強化ロッドなら爆風でもスロー
						slow_to_enemy(enemy_id, ice_level+1, defender_fire_damage);
					}
					if(blast_damageup){//クリスタルのダメージupあるなら
						if(point_distance(target_id.x, target_id.y, enemy_id.x, enemy_id.y) < EFFECT_BLAST_SIZE*blast_power/2){
							//爆風範囲の中心にいるとダメージup
							damage_result *= global.effectdata[17, effectdata.value];
							//効果範囲に追加で円を表示
							//blast_effect(target_id.x, target_id.y, blast_power/2, c_maroon, 16, 0.1);
						
							if(blast_onhit_effect){//クリスタルアップグレードされてあると通常攻撃時効果が膜風の中心にのる
								if(ice_level){//スロー
									slow_to_enemy(enemy_id, ice_level+1, defender_fire_damage);
								}
								if(odd_add_damage){//奇数追加ダメージ
									repeat(odd_add_damage){
										if(enemy_id.hp mod 2 = 1){
											damage += defender_fire_damage * POISONDAGGER_MAGNIFICATION
										}
									}
								}
								if(hpmax_add_damage){//hpmaxで追加ダメージ
									if(enemy_id.hp = enemy_id.hp_max){
											damage += defender_fire_damage * global.effectdata[31, effectdata.value];
									}
								}
								if(hpmax_add_damage_plus){//hpmaxで追加ダメージ アップグレード
									if(enemy_id.hp = enemy_id.hp_max){
										damage += defender_fire_damage * global.effectdata[32, effectdata.value];
									}
								}
							}
							
						}
					}
					if(demons_fire_level > 0){//悪魔の炎を持っているなら最終ダメージを上げる
						damage_result += demons_fire_level*global.effectdata[3, effectdata.value];
					}
					damage_result = ceil(damage_result)//ダメージ切り上げ
					//範囲内の敵にダメージを与える
					if(target_id != enemy_id){//ただしターゲットには既にダメージを与えているのであたえない
						enemy_id.hp -= damage_result;
						if(enemy_id.hp <= 0){//ダメージ記録
							record_damage(defender_id, damage_result+enemy_id.hp);//敵を倒した場合
						}
						else{
							record_damage(defender_id, damage_result);
						}
						draw_damage_value(enemy_id.x, enemy_id.y, damage_result);
					}
				
					//死亡判定
					if(enemy_id.hp <= 0){
						enemy_id.destroy_enemy = true;
						global.gold += global.enemydata[enemy_id_conversion(enemy_id.object_index), enemydata.dropgold];
						if(gold_get){//ゴールドゲットあるならそれも
							global.gold += global.effectdata[22, effectdata.value]
						}
						if(gold_get_plus){
							var get_gold = global.enemydata[enemy_id_conversion(enemy_id.object_index), enemydata.dropgold]+global.effectdata[22, effectdata.value]
							global.gold += ceil(get_gold*global.effectdata[20, effectdata.value]);
						}
						if(blast_onhit_effect){
							if(cooldown_reduction_40 != 0){//撃破時クールダウン短縮があるなら
								cooldown_reduction(defender_id, global.effectdata[4, effectdata.value], cooldown_reduction_40);
							}
						}
					}
				}
			}
		}
	}
}


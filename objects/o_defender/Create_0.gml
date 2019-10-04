for(var i=0; i<global.defender_category_amount; i++){//データから自分を探す
	if(global.defender_data[i, data.object] = object_index){
		defender_number = i;
		break
	}
}

//databaseからdefenderのデータをいれる
fire_damage_default = global.defender_data[defender_number, data.damage];
attack_per_second_default = global.defender_data[defender_number, data.attack_speed];
range_default = global.defender_data[defender_number, data.range];
cost = global.defender_data[defender_number, data.cost];
itemslot_amount = global.defender_data[defender_number, data.itemslot];
//エフェクトをいれる
for(var i=0; i<EFFECT_SLOT_MAX; i++){
	effect_now[i, effectnow.number] = -1;
}
if(global.defender_data[defender_number, data.effect] != -1){//エフェクト1
	effect_now[0, effectnow.number] = global.defender_data[defender_number,data.effect];
	effect_now[0, effectnow.time] = -1//無限
}
if(global.defender_data[defender_number, data.effect2] != -1){//エフェクト2があるならそれもいれる
	effect_now[1, effectnow.number] = global.defender_data[defender_number,data.effect2];
	effect_now[1, effectnow.time] = -1
}

attack_per_second = attack_per_second_default;
set_cooldown();
range = range_default;
fire_damage = fire_damage_default;
chronomancer_timing = 0;//フリーザーのクリスタルの範囲スローの発生頻度
remaining_bullets = 0;//ブラスターの残りショット数
blaster_shot_cooldown = BLASTER_SHOT_COOLDOWN;//ブラスターのショットのクールダウン

//スキル関連
skill_cooldown = -1;//一応
skill_state = skillstate.cooldown//デフォルト

target_id = false;
draw_debug_line = false

for(var i=0; i<global.item_category_amount; i++){//アイテムの装備設定を初期状態に
	equipped_item[i] = false; 
}

for(var i=0;i<itemslot_amount;i++){
	itemslot[i] = -1//アイテムスロットを初期状態に
}

state = state.decrement_cooldown;
enum state{
	decrement_cooldown,//攻撃のクールダウン中
	idle,//攻撃できるが周りに敵が居ない
	fire//攻撃の実行
}


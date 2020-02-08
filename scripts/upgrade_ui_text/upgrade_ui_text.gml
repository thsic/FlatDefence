///@param window_x, window_y, width, height
//defenderをクリックした時のウィンドウのテキストとか

var x_offset = argument0;
var y_offset = argument1;
var width = argument2;
var height = argument3;
draw_set_color(COLOR_TEXT_WHITE);
draw_sprite(upgrade_defender_id.sprite_index, 0, x_offset+22, y_offset+24);
draw_text(x_offset+42, y_offset+6, global.defender_data[upgrade_defender_id.defender_number, data.name]);
draw_set_color(COLOR_TEXT_ORANGE);
draw_text(x_offset+42, y_offset+22, global.defender_data[upgrade_defender_id.defender_number, data.description]);
//アイテムスロット
var item_number = 0;
for(var i=0; i<upgrade_defender_id.itemslot_amount; i++){
	if(upgrade_defender_id.itemslot[i] != -1){
		item_number++
	}
}

for(var i=0; i<item_number; i++){//アップグレード可能なアイテムか判定
	if(upgrade_button[i, upgradebutton.state] = 2){
		if(upgrade_button[i, upgradebutton.possibleupgrade]){
			var possible_upgrade = true
		}
		else{
			var possible_upgrade = false
		}
	}
}


//アイテムボタン
draw_set_halign(fa_middle)
for(var i=0; i<item_number; i++){
	var button_subimage = upgrade_button[i, upgradebutton.state]
	draw_set_font(FONT_DEFAULT);
	draw_sprite_ext(s_upgradeButton, button_subimage, upgrade_button[i, upgradebutton.sprite_x], upgrade_button[i, upgradebutton.sprite_y], 1, 1, 0, c_white, 0.7);
	draw_sprite(global.itemdata[upgrade_defender_id.itemslot[i], itemdata.sprite], 0, upgrade_button[i, upgradebutton.sprite_x]+24, upgrade_button[i, upgradebutton.sprite_y]+24);
	draw_set_valign(fa_middle);
	
	//はみ出しそうならフォントの大きさ変える
	if(string_width(global.itemdata[upgrade_defender_id.itemslot[i], itemdata.name]) > 110){
		var font_size = 1;
		
	}
	else{
		var font_size = 0;
	}
	if(string_width(global.itemdata[upgrade_defender_id.itemslot[i], itemdata.name]) > 130){
		var font_size = 2;
	}
	switch(font_size){
	case 0:	
		draw_set_font(FONT_DEFAULT);
	break
	case 1:
		draw_set_font(FONT_UPGRADETEXT);
	break
	case 2:
		draw_set_font(FONT_UPGRADETEXT_SMALL);
	break
	}
	
	//アイテム名描画
	draw_text(upgrade_button[i, upgradebutton.sprite_x]+96, upgrade_button[i, upgradebutton.sprite_y]+24, global.itemdata[upgrade_defender_id.itemslot[i], itemdata.name]);
}
draw_set_font(FONT_DEFAULT);
draw_set_color(COLOR_TEXT_WHITE);
draw_set_valign(fa_left);
if(possible_upgrade){//アップグレード決定ボタン(アップグレード不可のときはでてこない)
	button_subimage = upgrade_button[10, upgradebutton.state];
	draw_sprite(s_upgradeButton, button_subimage, upgrade_button[10, upgradebutton.sprite_x], upgrade_button[10, upgradebutton.sprite_y]);
	draw_text(upgrade_button[10, upgradebutton.sprite_x]+80, upgrade_button[10, upgradebutton.sprite_y]+12, "Upgrade");
}
else{
	draw_set_color(COLOR_TEXT_GRAY);
	button_subimage = 2;
	draw_sprite(s_upgradeButton, button_subimage, upgrade_button[10, upgradebutton.sprite_x], upgrade_button[10, upgradebutton.sprite_y]);
	draw_text(upgrade_button[10, upgradebutton.sprite_x]+80, upgrade_button[10, upgradebutton.sprite_y]+12, "Upgraded");
}

var upgrade_text_y = y_offset+180//このyの値を変えるといっぺんに変えれる
draw_set_color(COLOR_TEXT_WHITE);
draw_text(x_offset+width/2, y_offset+42, "Choose Upgrade Item!");


//比較用数値
var choosing_id = choosing_upgrade_item_id;
var skill_id = global.itemdata[choosing_id, itemdata.skill];
if(possible_upgrade){
	var choosing_after_upgrade_id = global.itemdata[choosing_id, itemdata.upgradeid];
	var skill_upgraed_id = global.itemdata[choosing_after_upgrade_id, itemdata.skill];
}

#region 下半分のテキスト
draw_set_halign(fa_left)
draw_set_color(COLOR_TEXT_GRAY);
if(skill_id = -1){
	draw_text(x_offset+80, upgrade_text_y, FIRE_DAMAGE_TEXT);
	draw_text(x_offset+80, upgrade_text_y+60, ATTACKSPEED_TEXT);
	draw_text(x_offset+80, upgrade_text_y+120, RANGE_TEXT);
	if(possible_upgrade){
		draw_text(x_offset+400, upgrade_text_y, FIRE_DAMAGE_TEXT);
		draw_text(x_offset+400, upgrade_text_y+60, ATTACKSPEED_TEXT);
		draw_text(x_offset+400, upgrade_text_y+120, RANGE_TEXT);
	}
}
else{
	draw_text(x_offset+80, upgrade_text_y, "EffectTime");
	draw_text(x_offset+80, upgrade_text_y+60, "Cooldown");
	if(possible_upgrade){
		draw_text(x_offset+400, upgrade_text_y, "EffectTime");
		draw_text(x_offset+400, upgrade_text_y+60, "Cooldown");
	}
}



draw_set_color(COLOR_TEXT_WHITE);
if(skill_id = -1){
	draw_text(x_offset+80, upgrade_text_y+20, global.itemdata[choosing_id, itemdata.damage]);
	draw_text(x_offset+80, upgrade_text_y+80, string_format(global.itemdata[choosing_id, itemdata.attack_speed], 1, 1));
	draw_text(x_offset+80, upgrade_text_y+140, global.itemdata[choosing_id, itemdata.range]);
}
else{
	draw_text(x_offset+80, upgrade_text_y+20, global.skilldata[skill_id, skilldata.skilltime]/FPS_DEFAULT);
	draw_text(x_offset+80, upgrade_text_y+80, global.skilldata[skill_id, skilldata.cooldown]/FPS_DEFAULT);
}


draw_set_color(COLOR_TEXT_WHITE);
if(possible_upgrade){
	//アップグレードで強化されていたら色を変える
	if(skill_id = -1){
		//アイテム アップグレード先描画
		//ダメージ
		if(global.itemdata[choosing_id, itemdata.damage] < global.itemdata[choosing_after_upgrade_id, itemdata.damage]){
			draw_sprite(s_rightArrow, 1, x_offset+width/2, upgrade_text_y+26);//強化されていたら矢印の色も変える
			draw_set_color(COLOR_TEXT_GREEN);
		}
		else{
			draw_sprite(s_rightArrow, 0, x_offset+width/2, upgrade_text_y+26);
			draw_set_color(COLOR_TEXT_GRAY);
		}
		draw_text(x_offset+400, upgrade_text_y+20, global.itemdata[choosing_after_upgrade_id, itemdata.damage]);
		draw_set_color(COLOR_TEXT_WHITE);
		//攻撃速度
		if(global.itemdata[choosing_id, itemdata.attack_speed] < global.itemdata[choosing_after_upgrade_id, itemdata.attack_speed]){
			draw_sprite(s_rightArrow, 1, x_offset+width/2, upgrade_text_y+86);
			draw_set_color(COLOR_TEXT_GREEN);
		}
		else{
			draw_sprite(s_rightArrow, 0, x_offset+width/2, upgrade_text_y+86);
			draw_set_color(COLOR_TEXT_GRAY);
		}
		draw_text(x_offset+400, upgrade_text_y+80, string_format(global.itemdata[choosing_after_upgrade_id, itemdata.attack_speed], 1, 1));
		draw_set_color(COLOR_TEXT_WHITE);
		//射程
		if(global.itemdata[choosing_id, itemdata.range] < global.itemdata[choosing_after_upgrade_id, itemdata.range]){
			draw_sprite(s_rightArrow, 1, x_offset+width/2, upgrade_text_y+146);
			draw_set_color(COLOR_TEXT_GREEN);
		}
		else{
			draw_sprite(s_rightArrow, 0, x_offset+width/2, upgrade_text_y+146);
			draw_set_color(COLOR_TEXT_GRAY);
		}
		draw_text(x_offset+400, upgrade_text_y+140, global.itemdata[choosing_after_upgrade_id, itemdata.range]);
	}
	else{
		//スキル アップグレード先
		//効果時間
		if(global.skilldata[skill_id, skilldata.skilltime] < global.skilldata[skill_upgraed_id, skilldata.skilltime]){
			draw_set_color(COLOR_TEXT_GREEN);
		}
		else{
			draw_set_color(COLOR_TEXT_WHITE);
		}
		draw_text(x_offset+400, upgrade_text_y+20, global.skilldata[skill_upgraed_id, skilldata.skilltime]/FPS_DEFAULT);
		//クールダウンだけ減っていたら色を変えるようにする
		if(global.skilldata[skill_id, skilldata.cooldown] > global.skilldata[skill_upgraed_id, skilldata.cooldown]){
			draw_set_color(COLOR_TEXT_GREEN);
		}
		else{
			draw_set_color(COLOR_TEXT_WHITE);
		}
		draw_text(x_offset+400, upgrade_text_y+80, global.skilldata[skill_upgraed_id, skilldata.cooldown]/FPS_DEFAULT);
	}
}
//アイテム説明テキスト
draw_set_halign(fa_middle);
draw_set_color(COLOR_TEXT_WHITE);//アップグレード前と文章が違ったら色を変える
var description1 = ""
var description2 = ""
var crystal_upgrade = false
if(choosing_id = 23){
	#region crystal
	var defender_number = upgrade_defender_id.defender_number
	switch(defender_number){
	case 0://basic
		var effect_id_befor = 15;
	break
	case 1://sniper
		var effect_id_befor = 16;
	break
	case 2://bomber
		var effect_id_befor = 17;
	break
	case 3://freezer
		var effect_id_befor = 18;
	break
	case 4://blaster
		var effect_id_befor = 19;
	break
	case 5://thief
		var effect_id_befor = 20;
	break
	}
	description1 = global.effectdata[effect_id_befor, effectdata.description];
	if(global.effectdata[effect_id_befor, effectdata.addeffect] != -1){
		description2 = global.effectdata[global.effectdata[effect_id_befor, effectdata.addeffect], effectdata.description];
	}
	crystal_upgrade = true
	#endregion
}
else{//普通
	if(global.itemdata[choosing_id, itemdata.effect] != -1){
		description1 = global.effectdata[global.itemdata[choosing_id, itemdata.effect], effectdata.description];
		if(global.effectdata[global.itemdata[choosing_id, itemdata.effect], effectdata.addeffect] != -1){
			description2 = global.effectdata[global.effectdata[global.itemdata[choosing_id, itemdata.effect], effectdata.addeffect], effectdata.description];
		}
	}
}

var description1_upgrade = ""
var description2_upgrade = ""
if(possible_upgrade){//upgrade先
	var freeze_rod = false
	if(choosing_after_upgrade_id = 16){//フリーズロッドの場合
		var description1_upgrade = global.effectdata[2, effectdata.description];
		var description2_upgrade = global.effectdata[12, effectdata.description];
		var freeze_rod = true
	}
	else if(crystal_upgrade){//クリスタルの場合
		#region クリスタル
		var defender_number = upgrade_defender_id.defender_number
		switch(defender_number){
			case 0://basic
				var effect_id = 24;
			break
			case 1://sniper
				var effect_id = 25;
			break
			case 2://bomber
				var effect_id = 26;
			break
			case 3://freezer
				var effect_id = 27;
			break
			case 4://blaster
				var effect_id = 28;
			break
			case 5://thief
				var effect_id = 29;
			break
		}
		description1_upgrade = string(global.effectdata[effect_id_befor, effectdata.description])+"@"+string(global.effectdata[effect_id, effectdata.description]);
		if(global.effectdata[effect_id, effectdata.addeffect] != -1){
			description2_upgrade = global.effectdata[global.effectdata[effect_id, effectdata.addeffect], effectdata.description];
		}
		#endregion
	}
	else{//普通
		if(global.itemdata[choosing_after_upgrade_id, itemdata.effect] != -1){
			description1_upgrade = global.effectdata[global.itemdata[choosing_after_upgrade_id, itemdata.effect], effectdata.description];
			if(global.effectdata[global.itemdata[choosing_after_upgrade_id, itemdata.effect], effectdata.addeffect] != -1){
				description2_upgrade = global.effectdata[global.effectdata[global.itemdata[choosing_after_upgrade_id, itemdata.effect], effectdata.addeffect], effectdata.description];
			}
		}
	}
	
}

//アップグレード前
var line_feed = false

/*if(string_width(description1) < 216){
	var text_x = x_offset+width/5*1
}
else if(string_width(description1) < 260){
	var text_x = (x_offset+width/5*1)+((string_width(description1)-216)/2)//はみ出しそうならテキストの位置を調整する
}
else{*/

//説明がすごく長いと改行
var text_x = (x_offset+width/5*1)+44/2//はみ出しそうならテキストの位置を調整する
if(string_count("@", description1)){	
	for(var i=0; i<string_count("@", description1); i++){
		description1 = string_replace(description1, "@", +chr(10))
	}
	line_feed = true
}
else{
	line_feed = false
}
//}
description1 = string_replace(description1, "@", "");

var overlap = false;
if(possible_upgrade){
	if(global.itemdata[choosing_after_upgrade_id, itemdata.effect] != -1){
		if(global.effectdata[global.itemdata[choosing_after_upgrade_id, itemdata.effect], effectdata.overlap]){
			overlap = true;
		
		}
	}
}
if(overlap){
	if(possible_upgrade){
		draw_text(text_x, upgrade_text_y+180, string(description1)+" Lv1");
	}
	else{
		draw_text(text_x, upgrade_text_y+180, string(description1)+" Lv2");
	}
}
else{
	draw_text(text_x, upgrade_text_y+180, string(description1));
}

//アップグレード後
var overlap = false//lvupするかどうか
if(possible_upgrade){
	/*if(string_width(description1_upgrade) < 218){
		var text_x = x_offset+width/5*4
	}
	else if(string_width(description1_upgrade) < 268){
		var text_x = (x_offset+width/5*4)-((string_width(description1_upgrade)-218)/2)//はみ出しそうならテキストの位置を調整する
	}
	else{*/
	var text_x = (x_offset+width/5*4)-44/2//はみ出しそうならテキストの位置を調整する
	if(string_count("@", description1_upgrade)){
		for(var i=0; i<5; i++){//@があるなら改行する
			description1_upgrade = string_replace(description1_upgrade, "@", +chr(10))
		}
		line_feed = true
	}
	else{
		line_feed = false
	}
	
	//}
	description1_upgrade = string_replace(description1_upgrade, "@", "");
	
	if(description1 != description1_upgrade){//文章比較
		if(!crystal_upgrade){
			if(global.effectdata[global.itemdata[choosing_after_upgrade_id, itemdata.effect], effectdata.number] != 9){//効果違ったら緑で
				draw_set_color(COLOR_TEXT_GREEN);
			}
			else{
				//例外でbasicsword+のTrue Basicだけはデメリット効果として赤で表示する
				draw_set_color(COLOR_TEXT_RED);			
			}
		}
		else{
			draw_set_color(COLOR_TEXT_GREEN);//クリスタルは全部緑
		}
	}
	else if(global.effectdata[global.itemdata[choosing_after_upgrade_id, itemdata.effect], effectdata.overlap]){//LVupするなら緑にする
		draw_set_color(COLOR_TEXT_GREEN);
		overlap = true
	}
	else{
		draw_set_color(COLOR_TEXT_WHITE);
	}
	
	//アップグレード先描画
	if(!freeze_rod){
		if(overlap){
			//現在レベル取得
			/*var effect_id = global.itemdata[choosing_id, itemdata.effect];
			var effect_level = 0;
			for(var i=0; i<EFFECT_SLOT_MAX; i++){
				if(upgrade_defender_id.effect_now[i, effectnow.number] != -1){
					if(upgrade_defender_id.effect_now[i, effectnow.number] = effect_id){
						effect_level++;
					}
				}
				else{
					break//forから抜ける
				}
			}*/
			
			//defenderからエフェクトレベルを取得する処理を書いたけどここのテキストはアイテム単体のことなのでLv2固定だった
			draw_text(text_x, upgrade_text_y+180, string(description1_upgrade)+" Lv2");
		}
		else{
			draw_text(text_x, upgrade_text_y+180, description1_upgrade);
		}
		
	}
	else{
		draw_set_color(COLOR_TEXT_WHITE);
		draw_text(text_x, upgrade_text_y+180, description1_upgrade);
	}
	
}

if(!line_feed){
	var text_y = upgrade_text_y+196;
}
else{
	var text_y = upgrade_text_y+196+16;
}
draw_set_color(COLOR_TEXT_WHITE);
draw_text(x_offset+width/5*1+44/2, text_y, description2);
if(possible_upgrade){
	if(description2 != description2_upgrade){
		draw_set_color(COLOR_TEXT_DARKGREEN);
	}
	else{
		draw_set_color(COLOR_TEXT_WHITE);
	}
	if(!freeze_rod){
		draw_text(x_offset+width/5*4-44/2, text_y, description2_upgrade);
	}
	else{
		description2_upgrade = string_replace(description2_upgrade, "@", +chr(10))
		draw_set_color(COLOR_TEXT_WHITE);
		draw_text(x_offset+width/5*4-44/2, text_y, global.effectdata[11, effectdata.description]);
		draw_set_color(COLOR_TEXT_GREEN);
		draw_text(x_offset+width/5*4-44/2, text_y+16, description2_upgrade);
	}
}

draw_set_halign(fa_left);
draw_set_color(COLOR_DEFAULT);
#endregion


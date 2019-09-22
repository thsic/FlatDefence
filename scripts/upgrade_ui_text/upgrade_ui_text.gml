///@param window_x, window_y, width, height
//defenderをクリックした時のウィンドウのテキストとか

var x_offset = argument0;
var y_offset = argument1;
var width = argument2;
var height = argument3;
draw_set_color(COLOR_TEXT_WHITE);
draw_sprite(upgrade_defender_id.sprite_index, 0, x_offset+22, y_offset+24);
draw_text(x_offset+42, y_offset+6, global.defender_data[defender_id_conversion(upgrade_defender_id), data.name]);
draw_set_color(COLOR_TEXT_ORANGE);
draw_text(x_offset+42, y_offset+22, global.defender_data[defender_id_conversion(upgrade_defender_id), data.description]);
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

	draw_sprite_ext(s_upgradeButton, button_subimage, upgrade_button[i, upgradebutton.sprite_x], upgrade_button[i, upgradebutton.sprite_y], 1, 1, 0, c_white, 0.7);
	draw_sprite(global.itemdata[upgrade_defender_id.itemslot[i], itemdata.sprite], 0, upgrade_button[i, upgradebutton.sprite_x]+24, upgrade_button[i, upgradebutton.sprite_y]+24);
	draw_text(upgrade_button[i, upgradebutton.sprite_x]+96, upgrade_button[i, upgradebutton.sprite_y]+14, global.itemdata[upgrade_defender_id.itemslot[i], itemdata.name]);
}


draw_set_color(COLOR_TEXT_WHITE);
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
draw_text(x_offset+width/2, y_offset+38, "Choose Upgrade!");


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
	draw_text(x_offset+80, upgrade_text_y, "Damage");
	draw_text(x_offset+80, upgrade_text_y+60, "AttackSpeed");
	draw_text(x_offset+80, upgrade_text_y+120, "Range");
	if(possible_upgrade){
		draw_text(x_offset+400, upgrade_text_y, "Damage");
		draw_text(x_offset+400, upgrade_text_y+60, "AttackSpeed");
		draw_text(x_offset+400, upgrade_text_y+120, "Range");
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

draw_set_color(COLOR_TEXT_WHITE);//矢印
draw_sprite(s_rightArrow, 0, x_offset+width/2, upgrade_text_y+26);
draw_sprite(s_rightArrow, 0, x_offset+width/2, upgrade_text_y+86);
draw_sprite(s_rightArrow, 0, x_offset+width/2, upgrade_text_y+146);


if(skill_id = -1){
	draw_text(x_offset+80, upgrade_text_y+20, global.itemdata[choosing_id, itemdata.damage]);
	draw_text(x_offset+80, upgrade_text_y+80, global.itemdata[choosing_id, itemdata.attack_speed]);
	draw_text(x_offset+80, upgrade_text_y+140, global.itemdata[choosing_id, itemdata.range]);
}
else{
	draw_text(x_offset+80, upgrade_text_y+20, global.skilldata[skill_id, skilldata.skilltime]/FPS_DEFAULT);
	draw_text(x_offset+80, upgrade_text_y+80, global.skilldata[skill_id, skilldata.cooldown]/FPS_DEFAULT);
}

if(possible_upgrade){
	//アップグレードで強化されていたら色を変える
	if(skill_id = -1){
		//アイテム アップグレード先描画
		//ダメージ
		if(global.itemdata[choosing_id, itemdata.damage] < global.itemdata[choosing_after_upgrade_id, itemdata.damage]){
			draw_set_color(COLOR_TEXT_GREEN);
		}
		else{
			draw_set_color(COLOR_TEXT_WHITE);
		}
		draw_text(x_offset+400, upgrade_text_y+20, global.itemdata[choosing_after_upgrade_id, itemdata.damage]);
		//攻撃速度
		if(global.itemdata[choosing_id, itemdata.attack_speed] < global.itemdata[choosing_after_upgrade_id, itemdata.attack_speed]){
			draw_set_color(COLOR_TEXT_GREEN);
		}
		else{
			draw_set_color(COLOR_TEXT_WHITE);
		}
		draw_text(x_offset+400, upgrade_text_y+80, global.itemdata[choosing_after_upgrade_id, itemdata.attack_speed]);
		//射程
		if(global.itemdata[choosing_id, itemdata.range] < global.itemdata[choosing_after_upgrade_id, itemdata.range]){
			draw_set_color(COLOR_TEXT_GREEN);
		}
		else{
			draw_set_color(COLOR_TEXT_WHITE);
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
draw_set_color(COLOR_TEXT_ORANGE);//アップグレード前と文章が違ったら色を変える
draw_text(x_offset+width/5*1, upgrade_text_y+180, global.itemdata[choosing_id, itemdata.description]);
if(possible_upgrade){
	if(global.itemdata[choosing_id, itemdata.description] != global.itemdata[choosing_after_upgrade_id, itemdata.description]){
		draw_set_color(COLOR_TEXT_GREEN);
	}
	else{
		draw_set_color(COLOR_TEXT_ORANGE);
	}
	draw_text(x_offset+width/5*4, upgrade_text_y+180, global.itemdata[choosing_after_upgrade_id, itemdata.description]);
}


draw_set_halign(fa_left);
draw_set_color(COLOR_DEFAULT);
#endregion

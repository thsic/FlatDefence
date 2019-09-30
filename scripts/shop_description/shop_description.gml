///@param d/i,id,possession,defenderui
var description_type = argument0;
var target_id = argument1;
var possession = argument2;
var defender_ui = argument3;

var window_width = 250;
var window_height = 124;

var offset_x = mouse_x - window_width;
var offset_y = mouse_y;
var alpha = 0.85

if(defender_ui){
	var offset_x = mouse_x-window_width/2
	if(offset_x+window_width > window_get_width()-SHOP_WINDOW_WIDTH){//小窓が右に行きすぎないように調整
		offset_x = window_get_width()-SHOP_WINDOW_WIDTH-window_width
	}
	
}
if(offset_y+window_height > window_get_height()){//小窓が下に行きすぎないように調整
	offset_y = window_get_height()-window_height
}
if(offset_y < 0){
	offset_y = 0;
}
if(offset_x < 0){
	offset_x = 0;
}

surface_free(global.usefulwindow_surface[2]);

switch(description_type){
case 0://defender
	if(window_width < string_width(global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.description])+6){
		//説明文が長いならそれに応じてウィンドウの長さも変える
		offset_x -= string_width(global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.description])+12-window_width;
		window_width = string_width(global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.description])+12;
	}
	tiny_window(s_window, 2, offset_x, offset_y, window_width, window_height, alpha);
	draw_set_color(COLOR_TEXT_GRAY);
	draw_text(offset_x+6, offset_y+24, "Damage");
	draw_text(offset_x+6, offset_y+48, "AttackSpeed");
	draw_text(offset_x+6, offset_y+72, "Range");
	draw_set_color(COLOR_TEXT_WHITE);
	draw_text(offset_x+6, offset_y+4, global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.name]);
	draw_text(offset_x+150, offset_y+24, global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.damage]);
	draw_text(offset_x+150, offset_y+48, global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.attack_speed]);
	draw_text(offset_x+150, offset_y+72, global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.range]);
	draw_set_color(COLOR_TEXT_ORANGE);
	//説明文
	draw_text(offset_x+6, offset_y+96, global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.description]);
	draw_set_color(COLOR_TEXT_YELLOW);
	draw_set_halign(fa_right);
	draw_text(offset_x+window_width-6, offset_y+4, global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.cost]);
	draw_set_halign(fa_left);
	draw_set_color(COLOR_DEFAULT);
	
	
break
case 1://item
	var effect1 = -1
	var effect2 = -1
	if(global.itemdata[target_id, itemdata.effect] != -1){//エフェクトの説明文を入れる
		var effect1 = global.effectdata[global.itemdata[target_id, itemdata.effect], effectdata.number]
		var description1 = global.effectdata[effect1, effectdata.description];
		var description1_color = global.effectdata[effect1, effectdata.color];
		//説明文が長いならそれに応じてウィンドウの長さも変える
		if(window_width < string_width(description1)+6){
			offset_x -= string_width(description1)+12-window_width;
			window_width = string_width(description1)+12;
		}
		
		if(global.effectdata[global.itemdata[target_id, itemdata.effect], effectdata.addeffect] != -1){//説明2
			var effect2 = global.effectdata[global.effectdata[global.itemdata[target_id, itemdata.effect], effectdata.addeffect], effectdata.number]
			var description2 = global.effectdata[effect2, effectdata.description];
			var description2_color = global.effectdata[effect2, effectdata.color];
			if(window_width < string_width(description2)+6){
				offset_x -= string_width(description2)+12-window_width;
				window_width = string_width(description2)+12;
			}
			if(effect2 != -1){//説明文が2行なのでその分
				window_height += 16
			}
		}
	}
	if(offset_x < 0){
		offset_x = 0;
	}
	tiny_window(s_window, 2, offset_x, offset_y, window_width, window_height, alpha);
	draw_set_color(COLOR_TEXT_GRAY);
	draw_text(offset_x+6, offset_y+24, "Damage");
	draw_text(offset_x+6, offset_y+48, "AttackSpeed");
	draw_text(offset_x+6, offset_y+72, "Range");
	draw_set_color(COLOR_TEXT_WHITE);
	draw_text(offset_x+6, offset_y+4, global.itemdata[target_id, itemdata.name]);
	draw_text(offset_x+150, offset_y+24, global.itemdata[target_id, itemdata.damage]);
	draw_text(offset_x+150, offset_y+48, global.itemdata[target_id, itemdata.attack_speed]);
	draw_text(offset_x+150, offset_y+72, global.itemdata[target_id, itemdata.range]);
	
	draw_set_color(COLOR_TEXT_ORANGE);
	if(effect1 != -1){//説明文が存在する
		draw_set_color(description1_color);
		description1 = string_replace(description1, "@", "");
		draw_text(offset_x+6, offset_y+96, description1);
	}
	if(effect2 != -1){
		draw_set_color(description2_color);
		description2 = string_replace(description2, "@", "");
		draw_text(offset_x+6, offset_y+112, description2);
	}

	if(!possession){//所持品ならコストを表示しない
		draw_set_color(COLOR_TEXT_YELLOW);
		draw_set_halign(fa_right);
		draw_text(offset_x+window_width-6, offset_y+4, global.itemdata[target_id, itemdata.cost]);
		draw_set_halign(fa_left);
	}
	draw_set_color(COLOR_DEFAULT);
break
case 2://スキルアイテム
	var skill_id = global.itemdata[target_id, itemdata.skill]
	if(global.skilldata[skill_id, skilldata.description2] != ""){//説明2があるかどうかでwindowheightを変える
		window_height = 116
	}
	else{
		window_height = 100
	}
	if(offset_x < 0){
		offset_x = 0;
	}
	tiny_window(s_window, 2, offset_x, offset_y, window_width, window_height, alpha);
	draw_set_color(COLOR_TEXT_GRAY);
	draw_text(offset_x+6, offset_y+24, "Cooldown");
	draw_text(offset_x+6, offset_y+48, "EffectTime");
	draw_set_color(COLOR_TEXT_WHITE);
	draw_text(offset_x+6, offset_y+4, global.itemdata[target_id, itemdata.name]);
	draw_text(offset_x+150, offset_y+24, ceil(global.skilldata[skill_id, skilldata.cooldown]/FPS_DEFAULT));
	draw_text(offset_x+150, offset_y+48, floor(global.skilldata[skill_id, skilldata.skilltime]/FPS_DEFAULT));
	draw_set_color(COLOR_TEXT_BLUE);
	draw_text(offset_x+6, offset_y+72, global.skilldata[skill_id, skilldata.description1]);
	if(global.skilldata[skill_id, skilldata.description2] != ""){
		draw_set_color(COLOR_TEXT_RED);
		draw_text(offset_x+6, offset_y+92, global.skilldata[skill_id, skilldata.description2]);
	}
	
	if(!possession){//所持品ならコストを表示しない
		draw_set_color(COLOR_TEXT_YELLOW);
		draw_set_halign(fa_right);
		draw_text(offset_x+window_width-6, offset_y+4, global.itemdata[target_id, itemdata.cost]);
		draw_set_halign(fa_left);
	}
	draw_set_color(COLOR_DEFAULT);
break


default:
	sdm("error! shop_description")
break
}
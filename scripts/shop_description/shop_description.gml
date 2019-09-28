///@param d/i,id,possession
var description_type = argument0;
var target_id = argument1;
var possession = argument2;

var window_width = 250;
var window_height = 124;

var offset_x = mouse_x - window_width;
var offset_y = mouse_y;
var alpha = 0.85

if(offset_y+window_height > view_hport[0]){//小窓が下に行きすぎないように調整
	offset_y = view_hport[0]-window_height
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
	//説明文が長いならそれに応じてウィンドウの長さも変える
	if(window_width < string_width(global.itemdata[target_id, itemdata.description])+6){
		offset_x -= string_width(global.itemdata[target_id, itemdata.description])+12-window_width;
		window_width = string_width(global.itemdata[target_id, itemdata.description])+12;
	}
	if(global.itemdata[target_id, itemdata.description2] != ""){//説明2
		if(window_width < string_width(global.itemdata[target_id, itemdata.description2])+6){
			offset_x -= string_width(global.itemdata[target_id, itemdata.description2])+12-window_width;
			window_width = string_width(global.itemdata[target_id, itemdata.description2])+12;
		}
		if(global.itemdata[target_id, itemdata.description] != ""){//説明文が2行なのでその分
			window_height += 16
		}
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
	//説明文 アイテムの説明文表示はちょっと複雑
	if(global.itemdata[target_id, itemdata.description] != ""){
		if(global.itemdata[target_id, itemdata.description] != ""){
			//半分デメリット効果
			draw_text(offset_x+6, offset_y+96, global.itemdata[target_id, itemdata.description]);
			draw_set_color(COLOR_TEXT_RED);
			draw_text(offset_x+6, offset_y+112, global.itemdata[target_id, itemdata.description2]);
		}
		else{
			//普通
			draw_text(offset_x+6, offset_y+96, global.itemdata[target_id, itemdata.description]);
		}
	}
	else if(global.itemdata[target_id, itemdata.description2] != ""){
		//全部デメリット効果
		draw_set_color(COLOR_TEXT_RED);
		draw_text(offset_x+6, offset_y+96, global.itemdata[target_id, itemdata.description2]);
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
	window_height = 100
	tiny_window(s_window, 2, offset_x, offset_y, window_width, window_height, alpha);
	var skill_id = global.itemdata[target_id, itemdata.skill]
	draw_set_color(COLOR_TEXT_GRAY);
	draw_text(offset_x+6, offset_y+24, "Cooldown");
	draw_text(offset_x+6, offset_y+48, "EffectTime");
	draw_set_color(COLOR_TEXT_WHITE);
	draw_text(offset_x+6, offset_y+4, global.itemdata[target_id, itemdata.name]);
	draw_text(offset_x+150, offset_y+24, ceil(global.skilldata[skill_id, skilldata.cooldown]/FPS_DEFAULT));
	draw_text(offset_x+150, offset_y+48, floor(global.skilldata[skill_id, skilldata.skilltime]/FPS_DEFAULT));
	draw_set_color(COLOR_TEXT_ORANGE);
	draw_text(offset_x+6, offset_y+72, global.itemdata[target_id, itemdata.description]);
	
	if(!possession){//所持品ならコストを表示しない
		draw_set_color(COLOR_TEXT_YELLOW);
		draw_set_halign(fa_right);
		draw_text(offset_x+window_width-6, offset_y+4, global.itemdata[target_id, itemdata.cost]);
		draw_set_halign(fa_left);
	}
	draw_set_color(COLOR_DEFAULT);
break
case 3://defenderui内のアイテム
	var offset_x = mouse_x+20
	if(offset_x+window_width > window_get_width()-SHOP_WINDOW_WIDTH){//小窓が右に行きすぎないように調整
		offset_x = window_get_width()-SHOP_WINDOW_WIDTH-window_width
	}
	tiny_window(s_window, 7, offset_x, offset_y, window_width, window_height, alpha);
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
	draw_text(offset_x+6, offset_y+96, global.itemdata[target_id, itemdata.description]);
break
default:
	sdm("error! shop_description")
break
}
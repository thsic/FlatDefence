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

switch(description_type){
case 0:
	tiny_window(s_window, offset_x, offset_y, window_width, window_height, alpha);
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
	draw_text(offset_x+6, offset_y+96, global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.description]);
	draw_set_color(COLOR_TEXT_YELLOW);
	draw_set_halign(fa_right);
	draw_text(offset_x+window_width-6, offset_y+4, global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.cost]);
	draw_set_halign(fa_left);
	draw_set_color(COLOR_DEFAULT);
	
	
break
case 1:
	tiny_window(s_window, offset_x, offset_y, window_width, window_height, alpha);
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
	tiny_window(s_window, offset_x, offset_y, window_width, window_height, alpha);
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
case other:
	sdm("error! shop_description")
break
}
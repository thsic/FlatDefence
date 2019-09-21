///@param d/i,id
var description_type = argument0;
var target_id = argument1;

var window_width = 250;
var window_height = 100;
var offset_x = mouse_x - window_width;
var offset_y = mouse_y;

switch(description_type){
case 0:
	tiny_window(s_window, offset_x, offset_y, window_width, window_height, 0.8);
	draw_set_color(COLOR_TEXT_GRAY);
	draw_text(offset_x+6, offset_y+24, "Damage");
	draw_text(offset_x+6, offset_y+48, "AttackSpeed");
	draw_text(offset_x+6, offset_y+72, "Range");
	draw_set_color(COLOR_TEXT_WHITE);
	draw_text(offset_x+6, offset_y+4, global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.name]);
	draw_text(offset_x+150, offset_y+24, global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.damage]);
	draw_text(offset_x+150, offset_y+48, global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.attack_speed]);
	draw_text(offset_x+150, offset_y+72, global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.range]);
	
	draw_set_color(COLOR_TEXT_YELLOW);
	draw_set_halign(fa_right);
	draw_text(offset_x+window_width-6, offset_y+4, global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.cost]);
	draw_set_halign(fa_left);
	draw_set_color(COLOR_DEFAULT);
	
	
break

}
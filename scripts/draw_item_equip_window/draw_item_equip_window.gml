///@param defender_id,item_id

var defender_id = argument0;
var item_id = argument1;
var offset_x = defender_id.x+16;
var offset_y = defender_id.y-16;
var defender_power = defender_id.fire_damage;
var defender_attackspeed = defender_id.attack_per_second
var defender_range = defender_id.range;
var item_power = global.itemdata[item_id, itemdata.damage];
var item_attackspeed = global.itemdata[item_id, itemdata.attack_speed];
var item_range = global.itemdata[item_id, itemdata.range];
var width = 230;
var height = 230;
usefulwindow(s_window, 9, offset_x, offset_y, width, height, 1, 0.9);

draw_sprite(defender_id.sprite_index, 0, offset_x+18, offset_y+18);
draw_set_color(COLOR_TEXT_WHITE);
draw_set_font(FONT_ITEMNAME);
draw_text(offset_x+36, offset_y+2, global.defender_data[defender_id.defender_number, data.name]);
draw_set_font(FONT_DEFAULT);

switch(item_id){
case 0://オーブ
	draw_sprite(global.itemdata[0, itemdata.sprite], 0, offset_x+20, offset_y+60);
	draw_text(offset_x+20, offset_y+78, "アイテムをアップグレード"+chr(10)+"できます");
break	
case 23://クリスタル
	draw_sprite(global.itemdata[23, itemdata.sprite], 0, offset_x+20, offset_y+60);
	draw_text(offset_x+36, offset_y+52, "クリスタル");
break
default://オーブとクリスタル以外
	draw_set_halign(fa_middle);
	draw_set_color(COLOR_TEXT_WHITE_NEARGRAY);
	draw_set_alpha(0.7);
	draw_text(offset_x+54, offset_y+56, defender_power);
	draw_text(offset_x+54, offset_y+96, string_format(defender_attackspeed, 1, 1));
	draw_text(offset_x+54, offset_y+136, defender_range);
	draw_set_alpha(1);
	if(item_power > 0){
		draw_set_color(COLOR_TEXT_GREEN);
		draw_sprite(s_rightArrow, 1, offset_x+width/2, offset_y+68);
	}
	else{
		draw_set_color(COLOR_TEXT_WHITE_NEARGRAY);
		draw_sprite(s_rightArrow, 0, offset_x+width/2, offset_y+68);
	}
	draw_text(offset_x+width-54, offset_y+60, defender_power+item_power);
	if(item_attackspeed > 0){
		draw_set_color(COLOR_TEXT_GREEN);
		draw_sprite(s_rightArrow, 1, offset_x+width/2, offset_y+109);
	}
	else{
		draw_set_color(COLOR_TEXT_WHITE_NEARGRAY);
		draw_sprite(s_rightArrow, 0, offset_x+width/2, offset_y+108);
	}
	draw_text(offset_x+width-54, offset_y+100, string_format(defender_attackspeed+item_attackspeed, 1, 1));
	if(item_range > 0){
		draw_set_color(COLOR_TEXT_GREEN);
		draw_sprite(s_rightArrow, 1, offset_x+width/2, offset_y+148);
	}
	else{
		draw_set_color(COLOR_TEXT_WHITE_NEARGRAY);
		draw_sprite(s_rightArrow, 0, offset_x+width/2, offset_y+148);
	}
	draw_text(offset_x+width-54, offset_y+140, defender_range+item_range);


	draw_set_font(FONT_ITEMEQUIP_WINDOW_TEXT);
	draw_set_color(COLOR_TEXT_GRAY);
	draw_set_alpha(0.7);
	draw_text(offset_x+54, offset_y+42, FIRE_DAMAGE_TEXT);
	draw_text(offset_x+54, offset_y+84, ATTACKSPEED_TEXT);
	draw_text(offset_x+54, offset_y+124, RANGE_TEXT);
	draw_set_alpha(1);
	draw_text(offset_x+width-54, offset_y+42, FIRE_DAMAGE_TEXT);
	draw_text(offset_x+width-54, offset_y+84, ATTACKSPEED_TEXT);
	draw_text(offset_x+width-54, offset_y+124, RANGE_TEXT);
	draw_set_color(COLOR_TEXT_ORANGE);
	draw_text(offset_x+width/2, offset_y+26, "装備しますか？");
	/*draw_text(offset_x+width/4, offset_y+20, "装備前");
	draw_text(offset_x+width-width/4, offset_y+20, "装備後");*/
	draw_set_color(COLOR_DEFAULT);
	draw_set_font(FONT_DEFAULT);

	draw_set_alpha(0.7);
	for(var i=0; i<defender_id.itemslot_amount; i++){//現在
		if(i > 2){
			var item_sprite_x = offset_x+20+(i-3)*34;
			var item_sprite_y = offset_y+208;
		}
		else{
			var item_sprite_x = offset_x+20+i*34;
			var item_sprite_y = offset_y+176;
		}
		if(defender_id.itemslot[i] != -1){
			draw_sprite(global.itemdata[defender_id.itemslot[i], itemdata.sprite], 0, item_sprite_x, item_sprite_y);
		}
		else{
			draw_set_alpha(0.15);
			draw_rectangle(item_sprite_x-16, item_sprite_y-16, item_sprite_x+16, item_sprite_y+16, true);
			draw_set_alpha(0.7);
		}
	}

	draw_set_alpha(1);
	var drawed_grab_item = false;
	for(var i=0; i<defender_id.itemslot_amount; i++){//装備したあと
		if(i > 2){
			var item_sprite_x = offset_x+(width-108)+20+(i-3)*34;
			var item_sprite_y = offset_y+208;
		}
		else{
			var item_sprite_x = offset_x+(width-108)+20+i*34;
			var item_sprite_y = offset_y+176;
		}
		if(defender_id.itemslot[i] != -1){
			draw_sprite(global.itemdata[defender_id.itemslot[i], itemdata.sprite], 0, item_sprite_x, item_sprite_y);
		}
		else{
			if(!drawed_grab_item){
				draw_sprite(global.itemdata[item_id, itemdata.sprite], 0, item_sprite_x, item_sprite_y);
				drawed_grab_item = true;
			}
			else{
				draw_set_alpha(0.3);
				draw_rectangle(item_sprite_x-16, item_sprite_y-16, item_sprite_x+16, item_sprite_y+16, true);
				draw_set_alpha(1);
			}
		}
	}
}
draw_set_halign(fa_left);


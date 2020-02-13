///@param d/i,id,possession,defenderui
var description_type = argument0;
var target_id = argument1;
var possession = argument2;
var defender_ui = argument3;

var window_width = 250;
var window_height = 124;

var offset_x = mouse_x - window_width;
if(show_window){
	offset_x = mouse_x
}
var offset_y = mouse_y;
var alpha = 0.85

if(defender_ui){
	var offset_x = mouse_x-window_width/2
	if(offset_x+window_width > window_get_width()-SHOP_WINDOW_WIDTH){//小窓が右に行きすぎないように調整
		offset_x = window_get_width()-SHOP_WINDOW_WIDTH-window_width
	}
}
if(offset_x+window_width > view_wport[0]){//小窓がはみでないように
	offset_x = view_wport[0]-window_width;
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
	var defender_id = defender_id_conversion(shop_product[target_id, DEFENDER])
	draw_text(offset_x+6, offset_y+24, FIRE_DAMAGE_TEXT);
	draw_text(offset_x+6, offset_y+48, ATTACKSPEED_TEXT);
	draw_text(offset_x+6, offset_y+72, RANGE_TEXT);
	draw_set_color(COLOR_TEXT_WHITE);
	draw_text(offset_x+6, offset_y+4, global.defender_data[defender_id, data.name]);
	draw_text(offset_x+150, offset_y+24, global.defender_data[defender_id, data.damage]);
	draw_text(offset_x+150, offset_y+48, string_format(global.defender_data[defender_id, data.attack_speed], 1, 1));
	draw_text(offset_x+150, offset_y+72, global.defender_data[defender_id, data.range]);
	draw_set_color(COLOR_TEXT_ORANGE);
	//説明文
	draw_text(offset_x+6, offset_y+96, global.defender_data[defender_id_conversion(shop_product[target_id, DEFENDER]), data.description]);
	draw_set_color(COLOR_TEXT_YELLOW);
	draw_set_halign(fa_right);
	var nesessary_gold = global.defender_data[defender_id, data.cost];
	var nesessary_gold_default = nesessary_gold
	for(var i=0; i<shop_product[target_id, SALES]; i++){
		nesessary_gold *= PRICE_INCREASE;
	}
	var difference_gold = nesessary_gold - nesessary_gold_default;//差額求める
	draw_text(offset_x+window_width-6, offset_y+4, string(floor(nesessary_gold))+" Gold");
	draw_set_font(FONT_SHOP_GOLD_PLUS);
	draw_text(offset_x+window_width-2, offset_y+20, "(+"+string(floor(difference_gold))+" Gold)");
	draw_set_font(FONT_DEFAULT);
	draw_set_halign(fa_left);
	draw_set_color(COLOR_DEFAULT);
	
	
break
case 1://item
	var effect1 = -1
	var effect2 = -1
	var crystal = false
	var upgradeorb = false
	if(target_id = 23){crystal = true}//クリスタル専用処理
	if(target_id = 0){upgradeorb = true}//オーブ専用処理
	if(global.itemdata[target_id, itemdata.effect] != -1 or crystal){//エフェクトの説明文を入れる
		if(!crystal and !upgradeorb){
			var effect1 = global.effectdata[global.itemdata[target_id, itemdata.effect], effectdata.number]
			var description1 = global.effectdata[effect1, effectdata.description];
			var description1_color = global.effectdata[effect1, effectdata.color];
		}
		else{
			if(crystal){
				//クリスタルなら説明文が特殊
				var description1 = CRYSTAL_SHOP_DESCRIPTION;
				var description1_color = COLOR_TEXT_BLUE;
			}
			else if(upgradeorb){
				//オーブなら説明文が特殊
				var description1 = UPGRADEORB_SHOP_DESCRIPTION;
				var description1_color = COLOR_TEXT_BLUE;
			}
		}
		
		//説明文が長いならそれに応じてウィンドウの長さも変える
		if(window_width < string_width(description1)+6){
			offset_x -= string_width(description1)+12-window_width;
			window_width = string_width(description1)+12;
		}
		if(!crystal){
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
	}
	if(offset_x < 0){
		offset_x = 0;
	}
	tiny_window(s_window, 2, offset_x, offset_y, window_width, window_height, alpha);
	draw_set_color(COLOR_TEXT_GRAY);
	draw_text(offset_x+6, offset_y+24, FIRE_DAMAGE_TEXT);
	draw_text(offset_x+6, offset_y+48, ATTACKSPEED_TEXT);
	draw_text(offset_x+6, offset_y+72, RANGE_TEXT);
	draw_set_color(COLOR_TEXT_WHITE);
	draw_text(offset_x+6, offset_y+4, global.itemdata[target_id, itemdata.name]);
	draw_set_color_value(COLOR_TEXT_GREEN, COLOR_TEXT_WHITE, global.itemdata[target_id, itemdata.damage], 0)
	draw_text(offset_x+150, offset_y+24, global.itemdata[target_id, itemdata.damage]);
	draw_set_color_value(COLOR_TEXT_GREEN, COLOR_TEXT_WHITE, global.itemdata[target_id, itemdata.attack_speed], 0)
	draw_text(offset_x+150, offset_y+48, string_format(global.itemdata[target_id, itemdata.attack_speed], 1, 1));
	draw_set_color_value(COLOR_TEXT_GREEN, COLOR_TEXT_WHITE, global.itemdata[target_id, itemdata.range], 0)
	draw_text(offset_x+150, offset_y+72, global.itemdata[target_id, itemdata.range]);
	
	draw_set_color(COLOR_TEXT_ORANGE);
	if(effect1 != -1 or crystal or upgradeorb){//説明文が存在する もしくはクリスタルかオーブ
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
		var nesessary_gold = global.itemdata[target_id, itemdata.cost];
		var nesessary_gold_default = nesessary_gold
		
		for(var i=0; i<global.item_category_amount; i++){//みつける
			if(shop_item_product[i, ITEM] = global.itemdata[target_id, itemdata.number]){
				var item_shop_id = i
				break
			}
		}
		
		for(var i=0; i<shop_item_product[item_shop_id, SALES]; i++){
			nesessary_gold *= PRICE_INCREASE;
		}
		var difference_gold = nesessary_gold - nesessary_gold_default;//差額求める
		draw_text(offset_x+window_width-6, offset_y+4, string(floor(nesessary_gold))+" Gold");
		draw_set_font(FONT_SHOP_GOLD_PLUS);
		draw_text(offset_x+window_width-2, offset_y+20, "(+"+string(floor(difference_gold))+" Gold)");
		draw_set_halign(fa_left);
		draw_set_font(FONT_DEFAULT);
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
		var nesessary_gold = global.itemdata[target_id, itemdata.cost];
		for(var i=0; i<global.item_category_amount; i++){//みつける
			if(shop_item_product[i, ITEM] = global.itemdata[target_id, itemdata.number]){
				var item_shop_id = i
				break
			}
		}
		for(var i=0; i<shop_item_product[item_shop_id, SALES]; i++){
			nesessary_gold *= PRICE_INCREASE;
		}
		draw_text(offset_x+window_width-6, offset_y+4, floor(nesessary_gold));
		draw_set_halign(fa_left);
	}
	draw_set_color(COLOR_DEFAULT);
break


default:
	sdm("error! shop_description")
break
}
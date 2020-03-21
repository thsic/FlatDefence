///右側にでてくるショップ
//drawに置け
var window_height = window_get_height();
var x_offset = window_get_width()-SHOP_WINDOW_WIDTH
usefulwindow(s_windowShop, 1, window_get_width()-SHOP_WINDOW_WIDTH, 0, SHOP_WINDOW_WIDTH, window_height, 1,1);

draw_set_color(COLOR_TEXT_YELLOW);
draw_text(x_offset+16,24,global.gold);//お金描画
draw_text(x_offset+68,24,"Gold")
draw_set_font(FONT_SHOP);
draw_set_color(COLOR_TEXT_SHOP)
draw_text(x_offset+14,72,"Defender");
draw_text(x_offset+14,168,"Item");
draw_text(x_offset+14,388,"Inventory");
draw_set_font(FONT_DEFAULT);
draw_set_color(c_white);
for(var i=0; i<product_defender_amount; i++){//defenderを描画
	var necessary_gold = global.defender_data[defender_id_conversion(shop_product[i, DEFENDER]), data.cost]
	for(var j=0; j<shop_product[i, SALES]; j++){
		necessary_gold *= PRICE_INCREASE;
	}
	
	if(global.gold < necessary_gold){
		//お金が足りない商品は半透明にする
		draw_set_alpha(0.3);
		draw_sprite(object_get_sprite(shop_product[i, DEFENDER]), 0, shop_product[i, SPRITE_X], shop_product[i, SPRITE_Y]);
		draw_set_alpha(0.5);
	}
	else{
		//足りる場合
		draw_set_alpha(1);
		draw_sprite(object_get_sprite(shop_product[i, DEFENDER]), 0, shop_product[i, SPRITE_X], shop_product[i, SPRITE_Y]);
		draw_set_alpha(0.9);
	}
	
	//値段表示
	draw_set_halign(fa_middle);
	draw_set_color(COLOR_TEXT_YELLOW);
	draw_text(shop_product[i, SPRITE_X], shop_product[i, SPRITE_Y]+18, floor(necessary_gold));
	draw_set_halign(fa_left);
	draw_set_color(COLOR_DEFAULT);
	draw_set_alpha(1);
}

for(i=0; i<product_item_amount; i++){//itemを描画
	var necessary_gold = shop_item_product[i, COST];
	for(var j=0; j<shop_item_product[i, SALES]; j++){
		necessary_gold *= PRICE_INCREASE;
	}
	
	if(global.gold < necessary_gold){
		//半透明
		draw_set_alpha(0.3);
		draw_sprite(shop_item_product[i, SPRITE], 0, shop_item_product[i, SPRITE_X], shop_item_product[i, SPRITE_Y]);
		draw_set_alpha(0.5);
	}
	else{
		draw_set_alpha(1);
		draw_sprite(shop_item_product[i, SPRITE], 0, shop_item_product[i, SPRITE_X], shop_item_product[i, SPRITE_Y]);
		draw_set_alpha(0.8);
	}
	
	//値段表示
	draw_set_halign(fa_middle);
	draw_set_color(COLOR_TEXT_YELLOW);
	draw_set_font(FONT_SHOP_COST);
	draw_text(shop_item_product[i, SPRITE_X], shop_item_product[i, SPRITE_Y]+17, floor(necessary_gold));
	draw_set_halign(fa_left);
	draw_set_color(COLOR_DEFAULT);
	draw_set_font(FONT_DEFAULT);
	draw_set_alpha(1);
}

for(i=0; i<POSSESSION_ITEM_MAX; i++){//所持itemを描画
	if(item_possession_data[i, ITEM] != -1){
		draw_sprite(item_possession_data[i, SPRITE], 0, item_possession_data[i, SPRITE_X], item_possession_data[i, SPRITE_Y])
	}
}

//カーソルを合わせたときの小窓
var draw_description = false //このフレームでdescriptionが描画されているならtrue
if(global.gamestate != gamestate.gameover and global.gamestate != gamestate.stageclear){//ゲームオーバーやクリア画面では表示されない
	for(var i=0;i<global.shop_defender_amount; i++){//defender
		if(shop_product[i, SPRITE_X]-SPRITE_SIZE < window_mouse_get_x() and window_mouse_get_x() < shop_product[i, SPRITE_X]+SPRITE_SIZE){
			if(shop_product[i, SPRITE_Y]-SPRITE_SIZE < window_mouse_get_y() and window_mouse_get_y() < shop_product[i, SPRITE_Y]+SPRITE_SIZE){
				draw_description = true
				shop_description(0, i, false, false);
			}
		}
	}
	for(var i=0;i<global.shop_item_amount; i++){//item
		if(shop_item_product[i, SPRITE_X]-SPRITE_SIZE < window_mouse_get_x() and window_mouse_get_x() < shop_item_product[i, SPRITE_X]+SPRITE_SIZE){
			if(shop_item_product[i, SPRITE_Y]-SPRITE_SIZE < window_mouse_get_y() and window_mouse_get_y() < shop_item_product[i, SPRITE_Y]+SPRITE_SIZE){
				if(global.itemdata[shop_item_product[i, ITEM], itemdata.skill] = -1){
					shop_description(1, shop_item_product[i, ITEM], false, false);
				}
				else{
					shop_description(2, shop_item_product[i, ITEM], false, false);
				}
				if(shop_item_product[i, ITEM]) = 23{
					shop_description(1, shop_item_product[i, ITEM], false, false);
				}
				draw_description = true
			}
		}
	}
	for(var i=0;i<POSSESSION_ITEM_MAX; i++){//possession item
		if(item_possession_data[i, SPRITE_X]-SPRITE_SIZE < window_mouse_get_x() and window_mouse_get_x() < item_possession_data[i, SPRITE_X]+SPRITE_SIZE){
			if(item_possession_data[i, SPRITE_Y]-SPRITE_SIZE < window_mouse_get_y() and window_mouse_get_y() < item_possession_data[i, SPRITE_Y]+SPRITE_SIZE){
				if(global.item_possession[i] != -1){
					if(global.itemdata[global.item_possession[i], itemdata.skill] = -1){	
						shop_description(1, global.item_possession[i], true, false);
					}
					else{
						shop_description(2, global.item_possession[i], true, false);
					}
					draw_description = true
				}
			}
		}
	}
}

if(!draw_description){//このフレームでdescriptionが描画されていないならsurfaceを消す
	surface_free(global.usefulwindow_surface[2]);
}

draw_description_window = draw_description;

if(grab_defender_id != -1){//商品を掴んでいる
	
	var defender_range_mag = 1;//rangeマーカーの上に置くと射程が増える用
	var draw_enhancement_description = false
	var nearest_marker = noone;
	var nearest_marker_distance = 10000;
	for(var i=0; i<instance_number(o_defenderMarker); i++){//すべてのマーカーの中からdefender置かれてるやつ以外で一番近いのをさがす
		var nearest_marker_temp = instance_find(o_defenderMarker, i);
		var nearest_marker_temp_distance = point_distance(nearest_marker_temp.x, nearest_marker_temp.y, mouse_x-16, mouse_y-16);
		
		if(nearest_marker_distance > nearest_marker_temp_distance and !nearest_marker_temp.on_defender){
			nearest_marker = nearest_marker_temp;
			nearest_marker_distance = nearest_marker_temp_distance;
		}
	}
	
	//持ってる時バフ付きマスにカーソルをあわせた場合説明表示
	if(nearest_marker != noone and !nearest_marker.on_defender){
		if(point_distance(mouse_x-15, mouse_y-15, nearest_marker.x, nearest_marker.y) < 24){
			if(nearest_marker.enhancement){
				draw_enhancement_description = true;
				var enhancement_type = -1;
				var enhancement_name = "";
				var enhancement_value = 0;
				//どのバフなのか
				if(nearest_marker.enhancement_attack){
					enhancement_type = 0;
					enhancement_name = FIRE_DAMAGE_MARKER_TEXT;
					enhancement_value = 1+(nearest_marker.enhancement_attack*MARKER_ENHANCEMENT_MAGNIFICATION);
				}
				if(nearest_marker.enhancement_range){
					enhancement_type = 1;
					enhancement_name = RANGE_MARKER_TEXT;
					enhancement_value = 1+(nearest_marker.enhancement_range*MARKER_ENHANCEMENT_MAGNIFICATION);
					defender_range_mag = enhancement_value;
				}
				if(nearest_marker.enhancement_attackspeed){
					enhancement_type = 2;
					enhancement_name = ATTACKSPEED_MARKER_TEXT;
					enhancement_value = 1+(nearest_marker.enhancement_attackspeed*MARKER_ENHANCEMENT_MAGNIFICATION);
				}
			}
		}
	}
	
	
	//おけるマーカーが近くにある場合 マーカーにハマる感じになる
	var possible_installation = false;
	if(nearest_marker != noone){
		if(point_distance(mouse_x-15, mouse_y-15, nearest_marker.x, nearest_marker.y) < 24){
			possible_installation = true;
		}
	}
	if(possible_installation and !nearest_marker.on_defender){
		var defender_sprite_x = nearest_marker.x+16
		var defender_sprite_y = nearest_marker.y+16
	}
	else{
		var defender_sprite_x = window_mouse_get_x();
		var defender_sprite_y = window_mouse_get_y();
	}
	draw_sprite(object_get_sprite(grab_defender_id), 0, defender_sprite_x, defender_sprite_y);
	
	//円描画
	//円の色を少しわかりやすくする
	var circle_color_default = global.defender_data[defender_id_conversion(grab_defender_id), data.color];
	var defender_color_hue = color_get_hue(circle_color_default);
	var defender_color_saturation = color_get_saturation(circle_color_default)+60;
	var defender_color_value = color_get_value(circle_color_default)-50;
	var circle_color = make_color_hsv(defender_color_hue, defender_color_saturation, defender_color_value)
	draw_set_color(circle_color);
	//draw_set_color(global.defender_data[grab_defender_id, data.color]);
	draw_set_alpha(0.15);
	draw_circle(defender_sprite_x, defender_sprite_y, global.defender_data[defender_id_conversion(grab_defender_id), data.range]*defender_range_mag, false);
	draw_set_alpha(0.6);
	draw_circle(defender_sprite_x, defender_sprite_y, global.defender_data[defender_id_conversion(grab_defender_id), data.range]*defender_range_mag, true);
	draw_set_color(COLOR_DEFAULT);
	draw_set_alpha(1);
	
	//射程円の描画後にマーカーの説明描画
	//説明表示
	if(draw_enhancement_description){
		var description = MARKER_ENHANCEMENT_DESCRIPTION1+enhancement_name+MARKER_ENHANCEMENT_DESCRIPTION2+string_format(enhancement_value, 1, 1)+MARKER_ENHANCEMENT_DESCRIPTION3;
		description = string_replace(description, "@", "");
		if(mouse_x+string_width(description)+16 < window_get_width()){
			var window_x = nearest_marker.x+32;
		}
		else{
			var window_x = window_get_width()-string_width(description)-16
		}
		var window_y = nearest_marker.y+2;
		surface_free(global.usefulwindow_surface[6]);
		tiny_window(s_window, 6, window_x, window_y, string_width(description)+10, 28, 1);
		draw_text(window_x+4, window_y+6, description);
	}		
	with(o_defenderMarker){//defender持ってる時はマーカー色変更
		subimage = 2
	}
}



if(grab_item_id != -1){//商品を掴んでいる
	draw_sprite(global.itemdata[grab_item_id, itemdata.sprite], 0, window_mouse_get_x(), window_mouse_get_y());
	
	var nearest_defender = noone;
	var nearest_defender_distance = 10000;
	for(var i=0; i<instance_number(o_defender); i++){//すべてのdefenderの中からアイテム装備できるやつ探す
		var nearest_defender_temp = instance_find(o_defender, i);
		var nearest_defender_temp_distance = point_distance(nearest_defender_temp.x, nearest_defender_temp.y, mouse_x, mouse_y);
		var possible_equip = false;
		for(var j=0; j<nearest_defender_temp.itemslot_amount; j++){//アイテムスロットに空きがあるか確認
			if(nearest_defender_temp.itemslot[j] = -1 or grab_item_id = 0){//オーブは空きがなくてもいい
				possible_equip = true;
			}
			//クリスタル装備してるやつにクリスタル装備させようとすることはできない
			if(grab_item_id = 23 and nearest_defender_temp.itemslot[j] = 23){
				possible_equip = false;
				break
			}
			if(grab_item_id = 0 and nearest_defender_temp.itemslot[0] = -1){
				//オーブを持っていて1番目のスロットが空の場合はオーブを装備できない
				possible_equip = false;
				break
			}
		}
		
		//条件にあった一番近いdefenderきめる
		if(nearest_defender_distance > nearest_defender_temp_distance and possible_equip){
			nearest_defender = nearest_defender_temp;
			nearest_defender_distance = nearest_defender_temp_distance;
		}
	}
	
	
	if(nearest_defender != noone){
		if(point_distance(mouse_x, mouse_y, nearest_defender.x, nearest_defender.y) < 32){
			draw_item_equip_window(nearest_defender, grab_item_id);//ウィンドウ描画
		
			/*//クリスタルの場合のみアイテムを装備した時の効果を表示
			if(grab_item_id = 23){
			var draw_description_crystal = true;
				if(nearest_defender != noone){
					//一番近いdefenderがすでにクリスタルを持っていたら説明を表示しない
					for(var i=0; i<nearest_defender.itemslot_amount; i++){
						if(nearest_defender.itemslot[i] = 23 or nearest_defender.itemslot[i] = 24){
							draw_description_crystal = false
							break
						}
					}
				
					if(draw_description_crystal){
						var defender_number = nearest_defender.defender_number;
						switch(defender_number){
						case 0://basic
							var effect_id = 15;
						break
						case 1://sniper
							var effect_id = 16;
						break
						case 2://bomber
							var effect_id = 17;
						break
						case 3://freezer
							var effect_id = 18;
						break
						case 4://blaster
							var effect_id = 19;
						break
						case 5://thief
							var effect_id = 20;
						break
						default:
							var effect_id = 0;
							sdm("error!draw_shop");
						break
						}
						//説明表示
						var description = global.effectdata[effect_id, effectdata.description]
						description = string_replace(description, "@", "");
						if(mouse_x+string_width(description)+16 < window_get_width()){
							var window_x = mouse_x;
						}
						else{
							var window_x = window_get_width()-string_width(description)-16
						}
						surface_free(global.usefulwindow_surface[6]);
						tiny_window(s_window, 6, window_x, mouse_y+10, string_width(description)+10, 28, 1);
						draw_set_color(COLOR_TEXT_WHITE)
						draw_text(window_x+4, mouse_y+16, description);
					}
				}
			}
		}
		else{
			//*/
		}
	}
}

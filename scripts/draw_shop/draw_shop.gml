///右側にでてくるショップ
//drawに置け
var window_height = window_get_height();
var x_offset = window_get_width()-SHOP_WINDOW_WIDTH
usefulwindow(s_window, 1, window_get_width()-SHOP_WINDOW_WIDTH, 0, SHOP_WINDOW_WIDTH, window_height, 1,1);

draw_set_color(c_yellow);
draw_text(x_offset+16,24,global.gold);//お金描画
draw_text(x_offset+68,24,"Gold")
draw_set_font(FONT_SHOP);
draw_set_color(COLOR_TEXT_SHOP)
draw_text(x_offset+14,72,"Defender");
draw_text(x_offset+14,190,"Item");
draw_text(x_offset+14,388,"Belongings");
draw_set_font(FONT_DEFAULT);
draw_set_color(c_white);
for(var i=0; i<product_defender_amount; i++){//defenderを描画
	var necessary_gold = global.defender_data[defender_id_conversion(shop_product[i, DEFENDER]), data.cost]
	for(var j=0; j<shop_product[i, SALES]; j++){
		necessary_gold *= PRICE_INCREASE;
	}
	if(global.gold < necessary_gold){
		//お金が足りない商品は半透明にする
		draw_sprite_ext(object_get_sprite(shop_product[i, DEFENDER]), 0, shop_product[i, SPRITE_X], shop_product[i, SPRITE_Y], 1, 1, 0, c_white, 0.3)
	}
	else{
		//足りる場合
		draw_sprite(object_get_sprite(shop_product[i, DEFENDER]), 0, shop_product[i, SPRITE_X], shop_product[i, SPRITE_Y]);
	}
}

for(i=0; i<product_item_amount; i++){//itemを描画
	var necessary_gold = global.itemdata[shop_item_product[i, ITEM], itemdata.cost];
	for(var j=0; j<shop_item_product[i, SALES]; j++){
		necessary_gold *= PRICE_INCREASE;
	}
	if(global.gold < necessary_gold){
		//半透明
		draw_sprite_ext(shop_item_product[i, SPRITE], 0, shop_item_product[i, SPRITE_X], shop_item_product[i, SPRITE_Y], 1, 1, 0, c_white, 0.3)
	}
	else{
		draw_sprite(shop_item_product[i, SPRITE], 0, shop_item_product[i, SPRITE_X], shop_item_product[i, SPRITE_Y]);
	}
}

for(i=0; i<POSSESSION_ITEM_MAX; i++){//所持itemを描画
	if(item_possession_data[i, ITEM] != -1){
		draw_sprite(item_possession_data[i, SPRITE], 0, item_possession_data[i, SPRITE_X], item_possession_data[i, SPRITE_Y])
	}
}

//カーソルを合わせたときの小窓
var draw_description = false //このフレームでdescriptionが描画されているならtrue
for(var i=0;i<global.shop_defender_amount; i++){//defender
	if(shop_product[i, SPRITE_X]-SPRITE_SIZE < window_mouse_get_x() and window_mouse_get_x() < shop_product[i, SPRITE_X]+SPRITE_SIZE){
		if(shop_product[i, SPRITE_Y]-SPRITE_SIZE < window_mouse_get_y() and window_mouse_get_y() < shop_product[i, SPRITE_Y]+SPRITE_SIZE){
			draw_description = true
			shop_description(0, i, false, false)
		}
	}
}
for(var i=0;i<global.shop_item_amount; i++){//item
	if(shop_item_product[i, SPRITE_X]-SPRITE_SIZE < window_mouse_get_x() and window_mouse_get_x() < shop_item_product[i, SPRITE_X]+SPRITE_SIZE){
		if(shop_item_product[i, SPRITE_Y]-SPRITE_SIZE < window_mouse_get_y() and window_mouse_get_y() < shop_item_product[i, SPRITE_Y]+SPRITE_SIZE){
			if(global.itemdata[shop_item_product[i, ITEM], itemdata.skill] = -1){
				shop_description(1, shop_item_product[i, ITEM], false, false)
			}
			else{
				shop_description(2, shop_item_product[i, ITEM], false, false)
			}
			if(shop_item_product[i, ITEM]) = 23{
				shop_description(1, shop_item_product[i, ITEM], false, false)
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
					shop_description(1, global.item_possession[i], true, false)
				}
				else{
					shop_description(2, global.item_possession[i], true, false)
				}
				draw_description = true
			}
		}
	}
}

if(!draw_description){//このフレームでdescriptionが描画されていないならsurfaceを消す
	surface_free(global.usefulwindow_surface[2]);
}


if(grab_defender_id != -1){//商品を掴んでいる
	draw_sprite(object_get_sprite(grab_defender_id), 0, window_mouse_get_x(), window_mouse_get_y());
	draw_set_alpha(0.6);//円
	//draw_set_color(global.defender_data[defender_id_conversion(grab_defender_id), data.color]);
	draw_set_color(c_dkgray);
	draw_circle(window_mouse_get_x(), window_mouse_get_y(), global.defender_data[defender_id_conversion(grab_defender_id), data.range], true);
	draw_set_color(COLOR_DEFAULT);
	draw_set_alpha(1);
	with(o_defenderMarker){
		subimage = 2
	}
}
if(grab_item_id != -1){//商品を掴んでいる
	draw_sprite(global.itemdata[grab_item_id, itemdata.sprite], 0, window_mouse_get_x(), window_mouse_get_y());
	
	//クリスタルの場合のみアイテムを装備した時の効果を表示
	if(grab_item_id = 23){
		var draw_description_crystal = true
		var nearest_defender = instance_nearest(mouse_x,mouse_y,o_defender);
		if(nearest_defender != noone){
			if(point_distance(mouse_x, mouse_y, nearest_defender.x, nearest_defender.y) < 32){
				//一番近いdefenderがすでにクリスタルを持っていたら説明を表示しない
				for(var i=0; i<nearest_defender.itemslot_amount; i++){
					if(nearest_defender.itemslot[i] = 23){
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
					tiny_window(s_window, 6, window_x, mouse_y+12, string_width(description)+16, 28, 1);
					draw_text(window_x+4, mouse_y+16, description);
				}
			}
		}
	}
}

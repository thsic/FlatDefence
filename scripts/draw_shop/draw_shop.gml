///右側にでてくるショップ
//drawに置け
var window_height = window_get_height();
var x_offset = window_get_width()-SHOP_WINDOW_WIDTH
usefulwindow(s_window, 1, window_get_width()-SHOP_WINDOW_WIDTH, 0, SHOP_WINDOW_WIDTH, window_height, 1,1);

draw_set_color(c_yellow);
draw_text(x_offset+16,24,global.gold)//お金描画
draw_set_color(c_white);
for(var i=0; i<product_defender_amount; i++){//defenderを描画
	if(global.gold < global.defender_data[defender_id_conversion(shop_product[i, DEFENDER]), data.cost]){
		//お金が足りない商品は半透明にする
		draw_sprite_ext(object_get_sprite(shop_product[i, DEFENDER]), 0, shop_product[i, SPRITE_X], shop_product[i, SPRITE_Y], 1, 1, 0, c_white, 0.3)
	}
	else{
		//足りる場合
		draw_sprite(object_get_sprite(shop_product[i, DEFENDER]), 0, shop_product[i, SPRITE_X], shop_product[i, SPRITE_Y]);
	}
}

for(i=0; i<product_item_amount; i++){//itemを描画
	if(global.gold < global.itemdata[shop_item_product[i, ITEM], itemdata.cost]){
		//お金が足りない商品は半透明にする
		draw_sprite_ext(shop_item_product[i, SPRITE], 0, shop_item_product[i, SPRITE_X], shop_item_product[i, SPRITE_Y], 1, 1, 0, c_white, 0.3)
	}
	else{
		//足りる場合
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
			shop_description(0, i, false)
		}
	}
}
for(var i=0;i<global.shop_item_amount; i++){//item
	if(shop_item_product[i, SPRITE_X]-SPRITE_SIZE < window_mouse_get_x() and window_mouse_get_x() < shop_item_product[i, SPRITE_X]+SPRITE_SIZE){
		if(shop_item_product[i, SPRITE_Y]-SPRITE_SIZE < window_mouse_get_y() and window_mouse_get_y() < shop_item_product[i, SPRITE_Y]+SPRITE_SIZE){
			if(global.itemdata[shop_item_product[i, ITEM], itemdata.skill] = -1){
				shop_description(1, shop_item_product[i, ITEM], false)
			}
			else{
				shop_description(2, shop_item_product[i, ITEM], false)
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
					shop_description(1, global.item_possession[i], true)
				}
				else{
					shop_description(2, global.item_possession[i], true)
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
	draw_set_alpha(0.1);
	draw_circle(window_mouse_get_x(), window_mouse_get_y(), global.defender_data[defender_id_conversion(grab_defender_id), data.range], true);
	draw_set_alpha(1);
}
if(grab_item_id != -1){//商品を掴んでいる
	draw_sprite(global.itemdata[grab_item_id, itemdata.sprite], 0, window_mouse_get_x(), window_mouse_get_y());
}
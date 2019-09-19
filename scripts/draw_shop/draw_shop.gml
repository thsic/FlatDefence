///右側にでてくるショップ
//drawに置け
var window_height = window_get_height();
var x_offset = window_get_width()-shop_window_width
usefulwindow(s_window, 1, window_get_width()-shop_window_width, 0, shop_window_width, window_height, 1,1);

draw_set_color(c_yellow);
draw_text(x_offset+16,24,global.gold)//お金描画
draw_set_color(c_white);
for(var i=0; i<product_defender_amount; i++){//defenderを描画
	if(global.gold < global.defender_data[i, data.cost]){
		//お金が足りない商品は半透明にする
		draw_sprite_ext(object_get_sprite(shop_product[i, DEFENDER]), 0, shop_product[i, SPRITE_X], shop_product[i, SPRITE_Y], 1, 1, 0, c_white, 0.3)
	}
	else{
		//足りる場合
		draw_sprite(object_get_sprite(shop_product[i, DEFENDER]), 0, shop_product[i, SPRITE_X], shop_product[i, SPRITE_Y]);
	}
}

for(var i=0;i<global.shop_defender_amount; i++){
	if(shop_product[i, SPRITE_X]-SPRITE_SIZE < window_mouse_get_x() and window_mouse_get_x() < shop_product[i, SPRITE_X]+SPRITE_SIZE){
		if(shop_product[i, SPRITE_Y]-SPRITE_SIZE < window_mouse_get_y() and window_mouse_get_y() < shop_product[i, SPRITE_Y]+SPRITE_SIZE){
			shop_description(0, i)
		}
	}
}

for(i=0; i<product_item_amount; i++){//itemを描画
	if(global.gold < global.itemdata[i, itemdata.cost]){
		//お金が足りない商品は半透明にする
		draw_sprite_ext(shop_item_product[i, SPRITE], 0, shop_item_product[i, SPRITE_X], shop_item_product[i, SPRITE_Y], 1, 1, 0, c_white, 0.3)
	}
	else{
		//足りる場合
		draw_sprite(shop_item_product[i, SPRITE], 0, shop_item_product[i, SPRITE_X], shop_item_product[i, SPRITE_Y]);
	}
}


if(grab_defender_id != -1){//商品を掴んでいる
	draw_sprite(object_get_sprite(grab_defender_id), 0, window_mouse_get_x(), window_mouse_get_y());
	draw_set_alpha(0.1);
	draw_circle(window_mouse_get_x(), window_mouse_get_y(), global.defender_data[defender_id_conversion(grab_defender_id), data.range], true);
	draw_set_alpha(1);
}
if(grab_item_id != -1){//商品を掴んでいる
	draw_sprite(shop_item_product[grab_item_id, SPRITE], 0, window_mouse_get_x(), window_mouse_get_y());
}
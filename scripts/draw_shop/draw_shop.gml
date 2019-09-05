///右側にでてくるショップ
//drawに置け
var window_height = window_get_height();
var x_offset = window_get_width()-shop_window_width
usefulwindow(s_window, 1, window_get_width()-shop_window_width, 0, shop_window_width, window_height, 1,1);

draw_set_color(c_yellow);
draw_text(x_offset+16,24,global.gold)//お金
draw_set_color(c_white);
for(i=0; i<product_defender_amount; i++){//defenderを描画
	if(global.gold < global.defender_data[i, data.cost]){
		//お金が足りない商品は半透明にする
		draw_sprite_ext(object_get_sprite(shop_product[i, DEFENDER]), 0, shop_product[i, SPRITE_X], shop_product[i, SPRITE_Y], 1, 1, 0, c_white, 0.3)
	}
	else{
		//足りる場合
		draw_sprite(object_get_sprite(shop_product[i, DEFENDER]), 0, shop_product[i, SPRITE_X], shop_product[i, SPRITE_Y]);
	}
}


if(grab_defender_id != -1){//商品を掴んでいる
	draw_sprite(object_get_sprite(grab_defender_id), 0, mouse_x, mouse_y);
	draw_set_alpha(0.1);
	draw_circle(mouse_x, mouse_y, global.defender_data[defender_id_conversion(grab_defender_id), data.range], true);
	draw_set_alpha(1);
}
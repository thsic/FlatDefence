///右側にでてくるショップ
//drawに置け
var window_width = 256;
var window_height = window_get_height();
var x_offset = window_get_width()-window_width
usefulwindow(s_window, 1, window_get_width()-window_width, 0, window_width, window_height, 1,1);
surface_set_target(global.usefulwindow_surface[1]);
draw_set_color(c_yellow);
draw_text(16,24,global.gold)
for(i=0; i<product_defender_amount; i++){
	draw_sprite(object_get_sprite(shop_product[i, DEFENDER]), 0, shop_product[i, SPRITE_X]-x_offset, shop_product[i, SPRITE_Y]);
}

surface_reset_target()

if(grab_defender_id != -1){//商品を掴んでいる
	draw_sprite(object_get_sprite(grab_defender_id), 0, mouse_x, mouse_y);

}
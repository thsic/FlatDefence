if(destroy_countdown = -1){
	var alpha = 1
}
else{
	var alpha = destroy_countdown/destroy_countdown_default
}
draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, COLOR_DEFAULT, alpha);
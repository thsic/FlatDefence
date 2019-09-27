draw_set_halign(fa_middle);
draw_set_color(COLOR_TEXT_WHITE);
draw_text(center_x, center_y, "Tower Defence Test");
draw_text(center_x, center_y+100, "StageSelect");
draw_text(center_x, center_y+132, "EndGame");

if(selecting_button != -1){
	draw_line(center_x-64, center_y+120+selecting_button*32, center_x+64, center_y+120+selecting_button*32);
}

draw_set_color(COLOR_DEFAULT);
draw_set_halign(fa_left)

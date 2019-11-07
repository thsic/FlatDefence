/*draw_set_halign(fa_middle);
draw_set_color(COLOR_TEXT_WHITE);
draw_text(center_x, center_y, "Tower Defence Test");
draw_text(center_x, center_y+100, "StageSelect");
draw_text(center_x, center_y+132, "EndGame");

if(selecting_button != -1){
	draw_line(center_x-64, center_y+120+selecting_button*32, center_x+64, center_y+120+selecting_button*32);
}

draw_set_color(COLOR_DEFAULT);
draw_set_halign(fa_left)
*/

draw_set_color(COLOR_BACKGROUND);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_halign(fa_middle);
/*color_hsv += 0.3;
if(color_hsv > 255){color_hsv -= 255};//一周*/
draw_set_color(make_color_hsv(90, 77, 136));


draw_set_font(FONT_TITLE);
draw_text(center_x, center_y-room_height/5, GAMENAME);
draw_set_font(FONT_DEFAULT);
draw_set_color(COLOR_TEXT_LTGRAY);
draw_text(center_x, center_y+room_height/4, "Click to start")
draw_set_halign(fa_left);
draw_set_color(COLOR_DEFAULT);

if(goto_stageselect != -1){
	draw_set_alpha(1-goto_stageselect/30);
	draw_set_color(COLOR_BACKGROUND);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_color(COLOR_DEFAULT);
	draw_set_alpha(1);
}
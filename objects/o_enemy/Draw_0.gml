var color = global.enemydata[enemy_number, enemydata.color];
var red = color_get_red(color);
var green = color_get_green(color);
var blue = color_get_blue(color);

var rectangle_size = 16;
if(enemy_number = 3 or enemy_number = 4 or enemy_number = 5){
	rectangle_size = 10;//small
}
else if(enemy_number = 21 or enemy_number = 22 or enemy_number = 23){
	rectangle_size = 20;//ボス
}

if(freeze_time != -1){//スローの時は色変化
	if(freeze_lv != -1){
		//フリーズレベルが高いほど色が変化
		red -= 6*freeze_lv;
		green -= 6*freeze_lv;
		blue += 6*freeze_lv;
	}
}

color = make_color_rgb(red, green, blue);
draw_set_color(color);
draw_rectangle(x-rectangle_size/2, y-rectangle_size/2, x+rectangle_size/2, y+rectangle_size/2, false);
draw_set_color(COLOR_DEFAULT);


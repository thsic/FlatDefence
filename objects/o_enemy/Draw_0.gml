var color = global.enemydata[enemy_number, enemydata.color];
var red = color_get_red(color);
var green = color_get_green(color);
var blue = color_get_blue(color);

var rectangle_size = 16;
if(enemy_number = 3 or enemy_number = 4 or enemy_number = 5){
	rectangle_size = 9;
}
//オブジェクトネームからレベル取得
var objectname = object_get_name(object_index);
var object_name_length = string_length(objectname);
var enemy_level = string_char_at(objectname, object_name_length);


//敵のレベルによって色調整
switch(enemy_level){
	case 1:
		red += 15;
		green += 15;
		blue += 15
	break
	case 2:
		
	break
	case 3:
		red -= 15;
		green -= 15;
		blue -= 15;
	break
}

if(freeze_time != -1){//スローの時は色変化
	if(freeze_lv != -1){
		//フリーズレベルが高いほど色が変化
		red -= 5*freeze_lv;
		green -= 5*freeze_lv;
		blue += 5*freeze_lv;
	}
}

color = make_color_rgb(red, green, blue);
draw_set_color(color);
draw_rectangle(x-rectangle_size/2, y-rectangle_size/2, x+rectangle_size/2, y+rectangle_size/2, false);
draw_set_color(COLOR_DEFAULT);


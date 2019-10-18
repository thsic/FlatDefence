///@param x,y,defenderid
var center_x = argument0;
var center_y = argument1;
var object_id = argument2;

var line_amount = 12;
var color = c_aqua;
var line_angle = 0

random_set_seed(date_current_datetime())
randomize();

//色決める defenderのスプライトから色を抽出する
var defender_sprite = object_get_sprite(object_id);
var s_width = sprite_get_width(defender_sprite);
var s_height = sprite_get_height(defender_sprite);
global.temp_surface = surface_create(s_width, s_height);//サーフェス作る
surface_set_target(global.temp_surface);
draw_sprite(defender_sprite, 0, 0, 0);//サーフェスにスプライト描画
var color = surface_getpixel(global.temp_surface, irandom(s_width), irandom(s_height))
repeat(5){//何回か色を抽出して平均の色を求める
	var width = irandom(s_width);
	var height = irandom(s_height);
	//なんかバグでうまくいかない 指定座標を0に近づけるとバグの発生率が下がる
	color = merge_color(color, surface_getpixel(global.temp_surface, 0, 0), 0.5); 
}
color = make_color_hsv(color_get_hue(color), 200, 235)//色を明るく
surface_reset_target();
surface_free(global.temp_surface);//不要になったので破棄

var angle_critelia = random(360);
var line_angle_interval = 360/line_amount;
var square_size = SPRITE_SIZE+2

for(var i=0; i<line_amount; i++){
	//基準の角度から遠すぎない範囲(/4)でランダムに
	line_angle[i] = random_range(angle_critelia+line_angle_interval*i-line_angle_interval/4, angle_critelia+line_angle_interval*i+line_angle_interval/4)
	
	for(var j=16; j<64; j+=2){//defenderの四角より外にラインを描画するために
		var line_x = lengthdir_x(j, line_angle[i])+center_x;
		var line_y = lengthdir_y(j, line_angle[i])+center_y;
		
		var decision = true
		if(center_x-square_size < line_x and line_x <  center_x+square_size){
			if(center_y-square_size < line_y and line_y < center_y+square_size){
				//座標が四角の中
				decision = false
			}
		}
		if(decision){break}//四角から出ているのでbreak
	}
	//色をランダムで変える
	var hue = color_get_hue(color)+irandom_range(-7, 7);
	var saturation = color_get_saturation(color)+irandom_range(-20, 20);
	var value = color_get_value(color)+irandom_range(-20, 20);
	if(hue > 255){hue -= 255}
	var line_color = make_color_hsv(hue, saturation, value);
	
	var time = random_range(7, 14)
	line_effect(line_x, line_y, 12, line_angle[i], time, time, line_color, 2, 0)
}
display_reset(8, false);
///@param x,y
var center_x = argument0;
var center_y = argument1;

var line_amount = 1;
var color = c_lime;
var line_angle = 0

random_set_seed(date_current_datetime())
randomize();

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
		if(decision){break}
		
	}
	line_effect(line_x, line_y, 20, line_angle[i], random_range(14, 26), color, 0.05, 0.05, 0, 2)
}

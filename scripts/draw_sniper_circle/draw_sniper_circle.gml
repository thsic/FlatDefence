///@param defender_id,x,y
var defender_id = argument0;
var _x = argument1;
var _y = argument2;

var snipe = 0;
var one_shot_one_kill = 0;

if(instance_exists(defender_id) and defender_id != -1){
	for(var i=0; i<EFFECT_SLOT_MAX; i++){
		if(defender_id.effect_now[i, effectnow.number] != -1){
			//何かしらのエフェクトがある
			switch(defender_id.effect_now[i, effectnow.number]){
			case 23:
				snipe++;
			break
			case 25:
				one_shot_one_kill++;
			break
			}
		}
		else{
			break
		}
	}
}


if(instance_exists(defender_id) and defender_id != -1){
	var maxrange = defender_id.range;
}
else{
	var maxrange = global.defender_data[1, data.range];
}
var minrange = SNIPER_MIN_RANGE;

var circle_smooth = 24;//円の滑らかさ
var circle_addangle = 360/circle_smooth;
#region minrange ~ maxrange
draw_set_alpha(0.15);
draw_primitive_begin(pr_trianglestrip);
for(var i=0; i<circle_smooth+1; i++){
	//奇数の点設定 外側の円
	var angle = circle_addangle*i;
	var temp_x = lengthdir_x(maxrange, angle)+_x;
	var temp_y = lengthdir_y(maxrange, angle)+_y;
	draw_vertex(temp_x, temp_y);
	var angle2 = angle
	var angle2 = point_direction(_x, _y, temp_x, temp_y);
			
	//偶数 内側の円
	var temp_x2 = lengthdir_x(minrange, angle2)+_x;
	var temp_y2 = lengthdir_y(minrange, angle2)+_y;
	//draw_line_color(temp_x, temp_y, temp_x2, temp_y2, c_blue, c_blue) テスト用
	//描画
	draw_vertex(temp_x2, temp_y2);
}
draw_primitive_end();
#endregion

if(snipe and maxrange > 150){
	#region 150 ~ maxrange
	draw_set_alpha(0.13);
	var snipe_range = 150;
	var circle_addangle = 360/circle_smooth;
	draw_primitive_begin(pr_trianglestrip);
	for(var i=0; i<circle_smooth+1; i++){
		//奇数の点設定 外側の円
		var angle = circle_addangle*i;
		var temp_x = lengthdir_x(maxrange, angle)+_x;
		var temp_y = lengthdir_y(maxrange, angle)+_y;
		draw_vertex(temp_x, temp_y);
		var angle2 = angle
		var angle2 = point_direction(_x, _y, temp_x, temp_y);
		
		//偶数 内側の円
		var temp_x2 = lengthdir_x(snipe_range, angle2)+_x;
		var temp_y2 = lengthdir_y(snipe_range, angle2)+_y;
		//draw_line_color(temp_x, temp_y, temp_x2, temp_y2, c_blue, c_blue) テスト用
		//描画
		draw_vertex(temp_x2, temp_y2);
	}
	draw_primitive_end();
#endregion
}
if(one_shot_one_kill and maxrange > 250){
	#region 250 ~ maxrange
	draw_set_alpha(0.18);
	var circle_addangle = 360/circle_smooth;
	var one_shot_range = 250;
	draw_primitive_begin(pr_trianglestrip);
	for(var i=0; i<circle_smooth+1; i++){
		//奇数の点設定 外側の円
		var angle = circle_addangle*i;
		var temp_x = lengthdir_x(maxrange, angle)+_x;
		var temp_y = lengthdir_y(maxrange, angle)+_y;
		draw_vertex(temp_x, temp_y);
		var angle2 = angle
		var angle2 = point_direction(_x, _y, temp_x, temp_y);
		
		//偶数 内側の円
		var temp_x2 = lengthdir_x(one_shot_range, angle2)+_x;
		var temp_y2 = lengthdir_y(one_shot_range, angle2)+_y;
		//draw_line_color(temp_x, temp_y, temp_x2, temp_y2, c_blue, c_blue) テスト用
		//描画
		draw_vertex(temp_x2, temp_y2);
	}
	draw_primitive_end();
	#endregion
}

draw_set_alpha(0.6);
draw_circle(_x, _y, maxrange, true);
draw_circle(_x, _y, minrange, true);
draw_set_alpha(1);

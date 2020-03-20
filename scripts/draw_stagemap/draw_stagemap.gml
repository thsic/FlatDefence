///@param stageid,x,y,mag
var stage_id = argument0;
var offset_x = argument1;
var offset_y = argument2;
var magnification = argument3;

var marker_grid_id = global.ds_marker_position[stage_id]
var route_grid_id = global.ds_route_position[stage_id]

var x2, y2;
var rectangle_size = 32*magnification;

//ルート描画
draw_set_color(COLOR_STAGESELECT_ROUTE);
draw_set_alpha(1);
for(var i=0; i<ds_grid_width(route_grid_id); i++){
	x2 = ds_grid_get(route_grid_id, i, marker_position.xx)* magnification;
	y2 = ds_grid_get(route_grid_id, i, marker_position.yy)* magnification;
	
	draw_rectangle(offset_x+x2, offset_y+y2, offset_x+x2+rectangle_size, offset_y+y2+rectangle_size, false);
}

//マーカー描画
var enhance_token_size = 3;
var enhance_token_column = 4;

for(var i=0; i<ds_grid_width(marker_grid_id); i++){
	draw_set_alpha(1);
	draw_set_color(COLOR_STAGESELECT_DEFENDER_MARKER);
	x2 = ds_grid_get(marker_grid_id, i, marker_position.xx)* magnification;
	y2 = ds_grid_get(marker_grid_id, i, marker_position.yy)* magnification;
	draw_rectangle(offset_x+x2, offset_y+y2, offset_x+x2+rectangle_size, offset_y+y2+rectangle_size, true);
	
	//強化マスならそれも描画
	var enhancement_type = ds_grid_get(marker_grid_id, i, marker_position.enhancement);
	if(enhancement_type != -1){
		var enhancement_level = ds_grid_get(marker_grid_id, i, marker_position.enhancement_level);
		x2 = ceil(x2);
		y2 = ceil(y2);
		
		draw_set_alpha(0.35);
		switch(enhancement_type){
		case 0:
			draw_enhancement_token(offset_x+x2, offset_y+y2, 0, enhancement_level, COLOR_MARKER_POWER, enhance_token_size, enhance_token_column);
		break
		case 1:
			draw_enhancement_token(offset_x+x2, offset_y+y2, 0, enhancement_level, COLOR_MARKER_ATTACKSPEED, enhance_token_size, enhance_token_column);
		break
		case 2:
			draw_enhancement_token(offset_x+x2, offset_y+y2, 0, enhancement_level, COLOR_MARKER_RANGE, enhance_token_size, enhance_token_column);
		break
		}
		
		
	}
}




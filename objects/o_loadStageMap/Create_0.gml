if(global.load_stage_map){
	var stage_number = 0;
	stage_number[1] = r_stage1;
	stage_number[2] = r_stage2;
	stage_number[3] = r_stage3;
	stage_number[4] = r_stage4;
	stage_number[5] = r_stage5;
	stage_number[6] = r_stage6;
	stage_number[7] = r_stage7;
	stage_number[8] = r_stage8;

	for(var i=1; i<8+1; i++){
		if(stage_number[i] = room){
			var room_number = i;
		}
	}
	
	//マーカー位置代入
	var marker_amount = instance_number(o_defenderMarker);
	ds_grid_resize(global.ds_marker_position[room_number], marker_amount, 4);
	for(var i=0; i<marker_amount; i++){
		var marker_id = instance_find(o_defenderMarker, i);
		ds_grid_set(global.ds_marker_position[room_number], i, marker_position.xx, marker_id.x);
		ds_grid_set(global.ds_marker_position[room_number], i, marker_position.yy, marker_id.y);
		
		if(marker_id.enhancement){//強化マスの場合
			if(marker_id.enhancement_attack > 0){
				ds_grid_set(global.ds_marker_position[room_number], i, marker_position.enhancement, 0);
				ds_grid_set(global.ds_marker_position[room_number], i, marker_position.enhancement_level, marker_id.enhancement_attack);
			}
			if(marker_id.enhancement_attackspeed > 0){
				ds_grid_set(global.ds_marker_position[room_number], i, marker_position.enhancement, 1);
				ds_grid_set(global.ds_marker_position[room_number], i, marker_position.enhancement_level, marker_id.enhancement_attackspeed);
			}
			if(marker_id.enhancement_range > 0){
				ds_grid_set(global.ds_marker_position[room_number], i, marker_position.enhancement, 2);
				ds_grid_set(global.ds_marker_position[room_number], i, marker_position.enhancement_level, marker_id.enhancement_range);
			}
		}
		else{
			ds_grid_set(global.ds_marker_position[room_number], i, marker_position.enhancement, -1);
			ds_grid_set(global.ds_marker_position[room_number], i, marker_position.enhancement_level, 0);
		}
		
	}
	
	//ルートオブジェクト位置代入
	var route_amount = instance_number(o_route);
	ds_grid_resize(global.ds_route_position[room_number], route_amount, 2);
	for(var i=0; i<route_amount; i++){
		var route_id = instance_find(o_route, i);
		ds_grid_set(global.ds_route_position[room_number], i, marker_position.xx, route_id.x);
		ds_grid_set(global.ds_route_position[room_number], i, marker_position.yy, route_id.y);
		
	}
	
	if(room_number != 8){
		room_goto(stage_number[room_number+1])
	}
	else{
		global.load_stage_map = false;
		room_goto(r_stageSelect);
	}
	
}
else{
	instance_destroy();//ロードじゃないなら不要なので消える
}

enum marker_position{
	xx,
	yy,
	enhancement,
	enhancement_level,
}

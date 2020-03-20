/*selecting_button = -1;
for(var i=0; i<2; i++){
	if(center_x-64 < mouse_x and mouse_x < center_x+64){
		if(center_y+100+i*32 < mouse_y and mouse_y < center_y+100+i*32 + 32){
			selecting_button = i;
		}
	}
}
if(mouse_check_button_pressed(mb_left)){
	switch(selecting_button){
	case 0:
		room_change(r_stageSelect);
	break
	case 1:
		game_end();
	break
	case -1:
	break
	}
}*/


if(change_room_frame_1 = 1){//ステージセレクト画面のためのステージ画像ロード
	var stage_number = 0;
	stage_number[1] = r_stage1;
	stage_number[2] = r_stage2;
	stage_number[3] = r_stage3;
	stage_number[4] = r_stage4;
	stage_number[5] = r_stage5;
	stage_number[6] = r_stage6;
	stage_number[7] = r_stage7;
	stage_number[8] = r_stage8;
	global.ds_marker_position = 0;
	global.ds_route_position = 0;
	global.load_stage_map = true;

	var duplicate_room_id = 0;
	for(var i=1; i<8+1; i++){
		//duplicate_room_id[i] = room_duplicate(stage_number[i]);
		room_instance_add(stage_number[i], 0, 0, o_loadStageMap);
		global.ds_marker_position[i] = ds_grid_create(100, 4);
		global.ds_route_position[i] = ds_grid_create(100, 2);
	}
	room_goto(stage_number[1]);
}

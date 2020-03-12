var window_x = 64;
var window_y = 0;
var window_gap = 8;


for(var i=0; i<STAGESELECT_BUTTON_AMOUNT; i++){
	window_y += STAGESELECT_BUTTON_HEIGHT+window_gap;
	stage_select_button[i, stageselectbutton.window_x] = window_x;
	stage_select_button[i, stageselectbutton.window_y] = window_y;
	stage_select_button[i, stageselectbutton.state] = 0;
}
if(window_x < mouse_x and mouse_x < window_x+STAGESELECT_BUTTON_WIDTH){
	if(stage_select_button[0, stageselectbutton.window_y] < mouse_y and mouse_y < stage_select_button[release_stage, stageselectbutton.window_y]+STAGESELECT_BUTTON_HEIGHT){
		//いずれかのボタンに触れている
		for(var i=0; i<STAGESELECT_BUTTON_AMOUNT; i++){//一旦ステートリセット
			stage_select_button[i, stageselectbutton.state] = 0;
		}
		
		var touch_button = floor((mouse_y-stage_select_button[0, stageselectbutton.window_y]+window_gap/2)/56);
		if(selecting_button != touch_button){
			//違うボタンになったらse再生
			play_se(SE_STAGESELECT_BUTTON_ON_MOUSE, 30, 0.2, false);
		}
		selecting_button = touch_button;
		stage_select_button[touch_button, stageselectbutton.state] = 1;

		
		if(mouse_check_button_pressed(mb_left) and stage_goto = -1){//クリックされたら
			surface_free(global.usefulwindow_surface[0]);
			surface_free(global.usefulwindow_surface[1]);
			surface_free(global.usefulwindow_surface[2]);
			//------------------------
			//     ステージ移動
			//------------------------
			play_se(SE_STAGESELECT_CLICK, 60, 0.4, true);
			switch(selecting_button){
			case 0:
				stage_goto = r_stage1;
			break
			case 1:
				stage_goto = r_stage2;
			break
			case 2:
				stage_goto = r_stage3;
			break
			case 3:
				stage_goto = r_stage4;
			break
			case 4:
				stage_goto = r_stage5;
			break
			case 5:
				stage_goto = r_stage6;
			break
			case 6:
				stage_goto = r_stage7;
			break
			case 7:
				stage_goto = r_stage8;
			break
			}
		}
	}
}

if(selecting_button != -1){
	stage_select_button[selecting_button, stageselectbutton.window_x] -= 12;
	stage_select_button[selecting_button, stageselectbutton.window_y] -= 10;
}

if(global.debugmode and keyboard_check_pressed(ord("T"))){
	stage_goto = r_test
}
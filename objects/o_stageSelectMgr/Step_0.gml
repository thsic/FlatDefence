var window_x = 64;
var window_y = 32;
var window_gap = 8;


for(var i=0; i<STAGESELECT_BUTTON_AMOUNT; i++){
	window_y += STAGESELECT_BUTTON_HEIGHT+window_gap;
	stage_select_button[i, stageselectbutton.window_x] = window_x;
	stage_select_button[i, stageselectbutton.window_y] = window_y;
	stage_select_button[i, stageselectbutton.state] = 0;
}
if(window_x < mouse_x and mouse_x < window_x+STAGESELECT_BUTTON_WIDTH){
	if(stage_select_button[0, stageselectbutton.window_y] < mouse_y and mouse_y < stage_select_button[STAGESELECT_BUTTON_AMOUNT-1, stageselectbutton.window_y]+STAGESELECT_BUTTON_HEIGHT){
		//いずれかのボタンに触れている
		for(var i=0; i<STAGESELECT_BUTTON_AMOUNT; i++){//一旦ステートリセット
			stage_select_button[i, stageselectbutton.state] = 0;
		}
		
		var touch_button = floor((mouse_y-stage_select_button[0, stageselectbutton.window_y]+window_gap/2)/56);
		selecting_button = touch_button;
		stage_select_button[touch_button, stageselectbutton.state] = 1;

		
		if(mouse_check_button_pressed(mb_left)){//クリックされたら
			surface_free(global.usefulwindow_surface[0]);
			surface_free(global.usefulwindow_surface[1]);
			//------------------------
			//     ステージ移動
			//------------------------
			switch(selecting_button){
			case 0:
				stage_goto = r_test;
				
			break
				
			}
		}
	}
}

if(selecting_button != -1){
	stage_select_button[selecting_button, stageselectbutton.window_x] -= 12;
	stage_select_button[selecting_button, stageselectbutton.window_y] -= 10;
}
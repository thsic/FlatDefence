load_score();

global.usefulwindow_surface[0] = noone;
global.usefulwindow_surface[1] = noone;
selecting_button = -1;

for(var i=0; i<STAGESELECT_BUTTON_AMOUNT; i++){
	stage_select_button[i, stageselectbutton.state] = 0;
}

change_room_frame_1 = -1
change_room_frame_2 = -1
stage_goto = -1;

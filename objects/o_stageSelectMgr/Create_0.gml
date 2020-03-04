load_score();

global.usefulwindow_surface[0] = noone;
global.usefulwindow_surface[1] = noone;
global.usefulwindow_surface[2] = noone;
selecting_button = -1;

for(var i=0; i<STAGESELECT_BUTTON_AMOUNT; i++){
	stage_select_button[i, stageselectbutton.state] = 0;
}

change_room_frame_1 = -1
change_room_frame_2 = -1
stage_goto = -1;

stage_release_score = [STAGE1_RELEASE_SCORE, STAGE2_RELEASE_SCORE, STAGE3_RELEASE_SCORE, STAGE4_RELEASE_SCORE, STAGE5_RELEASE_SCORE, STAGE6_RELEASE_SCORE, STAGE7_RELEASE_SCORE, STAGE8_RELEASE_SCORE];
for(var i=0; i<STAGE_AMOUNT; i++){
	if(stage_release_score[i] <= global.totalscore){
		release_stage = i;
	}
}

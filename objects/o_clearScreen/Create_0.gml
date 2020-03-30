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
change_screen = -1;

bgm_volume_default = global.bgm_volume;
global.bgm_volume *= 1.5;
var nowmusic_volume = global.musicdata[global.nowmusic_number, musicdata.volume];
if(global.bgm_volume > 1){
	global.bgm_volume = 1;
}
audio_sound_gain(global.nowmusic_number, global.bgm_volume*nowmusic_volume, 500);
sdm(string(global.bgm_volume*nowmusic_volume)+" "+string(bgm_volume_default*nowmusic_volume))


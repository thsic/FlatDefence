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

if(goto_stageselect != -1){
	if(goto_stageselect <= 0){
		room_change(r_stageSelect);
	}
	else{
		goto_stageselect--;
	}
}
else{
	if(mouse_check_button(mb_left)){
		goto_stageselect = 30;
	}
}
sdm(goto_stageselect)



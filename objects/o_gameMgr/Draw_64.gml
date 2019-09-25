/// @description UI表示

switch(global.gamestate){
case gamestate.wavestart:
	surface_free(global.usefulwindow_surface[4]);
break
case gamestate.reststart:
	surface_free(global.usefulwindow_surface[4]);
break
}

draw_ui();
switch(global.gamestate){
case gamestate.wavestart:
case gamestate.reststart:
case gamestate.rest:
case gamestate.restpause:
case gamestate.pause:
case gamestate.main:
case gamestate.waveclear:
case gamestate.stageclear:
	draw_time_machine();
	draw_shop();
	show_defender_ui();
break
}
switch(global.gamestate){
case gamestate.main:
	show_enemy_ui();
break
}


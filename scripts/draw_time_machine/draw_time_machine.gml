//タイムマシン描画
var window_x = global.timemachine[timemachine.window_x]
var window_y = global.timemachine[timemachine.window_y]
var width = TIMEMACHINE_WIDTH;
var height = TIMEMACHINE_HEIGHT;

tiny_window(s_window, 5, window_x , window_y, width, height, 1);
var button_offset_x = 20;
var button_offset_y = 42;
for(var i=0; i<3; i++){//ボタン描画
	switch(i){
	case 0:
		var sprite = s_timeMachineButtonPlay;
		var button = 0;
	break
	case 1:
		var sprite = s_timeMachineButtonPause;
		var button = 1;
	break
	case 2:
		var sprite = s_timeMachineButtonDoubleSpeed;
		var button = 2;
	break
	}
	draw_sprite(sprite, timemachine_button_state[button], window_x+button_offset_x+i*68, window_y+button_offset_y);
}


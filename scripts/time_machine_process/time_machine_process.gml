//タイムマシンの処理
var window_x = global.timemachine[timemachine.window_x];
var window_y = global.timemachine[timemachine.window_y];
var width = TIMEMACHINE_WIDTH;
var height = TIMEMACHINE_HEIGHT;

for(var i=0; i<3; i++){
	if(timemachine_button_state[i] = 1){
		timemachine_button_state[i] = 0;//押されていないボタンの状態をリセット
	}
}

#region キーボードショートカットでのステート変更処理
if(keyboard_check_pressed(DOUBLE_SPEED_BUTTON) or mouse_check_button_pressed(mb_right)){
	if(timemachine_button_state[2] = 2){
		for(var i=0; i<3; i++){
			timemachine_button_state[i] = 0;
		}
		timemachine_button_state[0] = 2//等速に
		timemachine_change_state(0);
		play_se(SE_TIMEMACHINE_BUTTON, 30, 0.15, false);
		audio_sound_pitch(SE_TIMEMACHINE_BUTTON, 1.2);
	}
	else{
		for(var i=0; i<3; i++){
			timemachine_button_state[i] = 0;
		}
		timemachine_button_state[2] = 2//コントロールキーが押されると倍速に
		timemachine_change_state(2);
		play_se(SE_TIMEMACHINE_BUTTON, 30, 0.15, false);
		audio_sound_pitch(SE_TIMEMACHINE_BUTTON, 1.2);
	}
	

}
/*if(keyboard_check_released(DOUBLE_SPEED_BUTTON)){
	for(var i=0; i<3; i++){
		timemachine_button_state[i] = 0;
	}
	timemachine_button_state[0] = 2//コントロールキーが離されると強制的に等速に
	timemachine_change_state(0);
}*/
if(keyboard_check_pressed(PAUSE_BUTTON) or mouse_check_button_pressed(mb_middle)){
	for(var i=0; i<3; i++){//スペース押されるとポーズかポーズ解除 中クリックでもポーズ
		if(timemachine_button_state[i] = 2){
			var pressed_button = i;
		}
		timemachine_button_state[i] = 0;
	}
	switch(pressed_button){
	case 0:
	case 2:
		timemachine_button_state[1] = 2;
		var button = 1
	break
	case 1:
		timemachine_button_state[0] = 2;
		var button = 0
	}
	timemachine_change_state(button);
	play_se(SE_TIMEMACHINE_BUTTON, 30, 0.15, false);
	audio_sound_pitch(SE_TIMEMACHINE_BUTTON, 1.2);
}
#endregion

if(window_x < mouse_x and mouse_x < window_x+width and window_y < mouse_y and mouse_y < window_y+height){
	//マウスがウィンドウ内にある
		
	//ボタン
	var button_offset_x = 4;
	var button_offset_y = 30;
	if(window_x+button_offset_x  < mouse_x and mouse_x < window_x+button_offset_x +3*68 and window_y+button_offset_y < mouse_y and mouse_y < window_y+button_offset_y+64){
		//いずれかのボタンの上にマウスがある
		//3つのボタンの範囲にマウスがあるのを検知して、ボタンのサイズ+間隔で割ることでどのボタンの上にあるか判定
		var mouse_on_button = floor((mouse_x-window_x-button_offset_x)/68);
		if(timemachine_button_state[mouse_on_button] != 2){
			timemachine_button_state[mouse_on_button] = 1;
		}
		if(mouse_check_button_pressed(mb_left)){//クリック
			for(var i=0; i<3; i++){//一旦全部リセットして マウスと重なっているボタンを押す
				timemachine_button_state[i] = 0;
			}
			timemachine_button_state[mouse_on_button] = 2;
			timemachine_change_state(mouse_on_button);//ステート変更
			play_se(SE_TIMEMACHINE_BUTTON, 30, 0.15, false);
			audio_sound_pitch(SE_TIMEMACHINE_BUTTON, 1.2);
		}
	}
	else{
		if(mouse_check_button_pressed(mb_left)){//クリックされた瞬間
			timemachine_grab = 1//クリックされているがマウスが動かされていない
			timemachine_grab_offset_x = window_x-mouse_x;
			timemachine_grab_offset_y = window_y-mouse_y;
		}
		if(timemachine_grab = 1){
			if(mouse_x != global.mouse_x_prev or mouse_y != global.mouse_y_prev){
				//マウスが動かされたのを検知する
				timemachine_grab = 2
			}
		}
	}
}
else{
	if(mouse_check_button_pressed(mb_left) and global.double_speed){
		//タイムマシンの外で押された+倍速状態だった
		var push_button_0 = true
		if(keyboard_check(DOUBLE_SPEED_BUTTON)){//倍速キーが押されていると外クリックしても倍速のまま
			push_button_0 = false;
		}
		if(global.gamestate = gamestate.rest){
			if(WAVESTART_BUTTON_X < mouse_x and mouse_x < WAVESTART_BUTTON_X+sprite_get_width(s_wavestartButton)){
				if(WAVESTART_BUTTON_Y < mouse_y and mouse_y < WAVESTART_BUTTON_Y+sprite_get_height(s_wavestartButton)){
					push_button_0 = false;//休憩中に倍速状態でウェーブスタートボタンを押されても倍速のまま
				}
			}
		}
			
		if(push_button_0){
			for(var i=0; i<3; i++){//全部リセットしてボタン0を押す
				timemachine_button_state[i] = 0;
			}
			timemachine_button_state[0] = 2;
			timemachine_change_state(0);
		}
	}
}


if(timemachine_grab = 2){
	global.timemachine[timemachine.window_x] = mouse_x+timemachine_grab_offset_x;
	global.timemachine[timemachine.window_y] = mouse_y+timemachine_grab_offset_y;
	//タイムマシンウィンドウを画面外に出さない
	if(window_get_width()-SHOP_WINDOW_WIDTH < global.timemachine[timemachine.window_x]+TIMEMACHINE_WIDTH){
		global.timemachine[timemachine.window_x] = window_get_width()-SHOP_WINDOW_WIDTH-TIMEMACHINE_WIDTH;
		
		//ウィンドウを画面外に出そうとしたときにoffsetを修正して操作感向上を図る
		if(global.timemachine[timemachine.window_x]-mouse_x < timemachine_grab_offset_x){
			timemachine_grab_offset_x = global.timemachine[timemachine.window_x]-mouse_x;
		}
	}
	if(window_get_height() < global.timemachine[timemachine.window_y]+TIMEMACHINE_HEIGHT){
		global.timemachine[timemachine.window_y] = window_get_height()-TIMEMACHINE_HEIGHT;
		
		if(global.timemachine[timemachine.window_y]-mouse_y < timemachine_grab_offset_y){
			timemachine_grab_offset_y = global.timemachine[timemachine.window_y]-mouse_y;
		}
	}
	if(0 > global.timemachine[timemachine.window_x]){
		global.timemachine[timemachine.window_x] = 0;
		
		if(global.timemachine[timemachine.window_x]-mouse_x > timemachine_grab_offset_x){
			timemachine_grab_offset_x = global.timemachine[timemachine.window_x]-mouse_x;
		}
	}
	if(0 > global.timemachine[timemachine.window_y]){
		global.timemachine[timemachine.window_y] = 0;
		
		if(global.timemachine[timemachine.window_y]-mouse_y > timemachine_grab_offset_y){
			timemachine_grab_offset_y = global.timemachine[timemachine.window_y]-mouse_y;
		}
	}
	
	if(!mouse_check_button(mb_left)){
		timemachine_grab = 0;
	}
}



///@param pressed_button

var pressed_button = argument0;

switch(pressed_button){
case 0:
case 2:
	if(pressed_button = 2){
		global.double_speed = true;
	}
	else{
		global.double_speed = false;
	}
	if(global.gamestate = gamestate.pause or global.gamestate = gamestate.restpause){
		sdm("ポーズ解除")
	}
	switch(global.gamestate){
	case gamestate.pause:
		global.gamestate = gamestate.main;
	break
	case gamestate.restpause:
		global.gamestate = gamestate.rest;
	break
	}
break
case 1:
	sdm("ポーズ")
	global.double_speed = false;
	switch(global.gamestate){
	case gamestate.main:
		global.gamestate = gamestate.pause;
	break
	case gamestate.rest:
		global.gamestate = gamestate.restpause;
	break
	}
}

if(global.double_speed){//倍速処理
	room_speed = FPS_DEFAULT*2;
}
else{
	room_speed = FPS_DEFAULT;
}


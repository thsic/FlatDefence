enum defender_status{
	damage,
	attack_speed,
	range	
}

enum gamestate{
	stagestart,
	wavestart,
	reststart,
	rest,
	restpause,
	pause,
	main,
	waveclear,
	stageclear,
	gameover
	
}

enum upgradebutton{
	sprite_x,
	sprite_y,
	state,
	possibleupgrade
}

enum spawnenemy{
	objectid,
	amount,
	number
	
}

enum timemachine{
	window_x,
	window_y,
	state,
	
	
}

enum stageselectbutton{
	window_x,
	window_y,
	state
	
}

enum effectnow{
	number,
	time
}

/// @description Draw nowmusicUI
//ステージ中のみbgm表示
if(instance_exists(o_gameMgr)){
	if(global.gamestate = gamestate.gameover or global.gamestate = gamestate.stageclear){
		draw_nowmusic_ui = false;
	}
}
else{
	draw_nowmusic_ui = false;
}

if(draw_nowmusic_ui){
	draw_nowmusic();
}
else{
	draw_nowmusic_ui = true;
}

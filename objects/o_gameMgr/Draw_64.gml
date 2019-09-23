/// @description UI表示

show_defender_ui();
draw_shop();
draw_ui();

switch(global.gamestate){
case gamestate.main:
	show_enemy_ui();
break
}
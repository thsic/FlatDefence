if(global.draw_enemyhp){
	if(enemy_number = 21 or enemy_number = 22 or enemy_number = 23){
		draw_bar("bosshp" ,hp, hp_max, COLOR_BAR_ENEMYHP, COLOR_BAR_ENEMYHP_UNDER);
	}
	else{
		draw_bar("hp" ,hp, hp_max, COLOR_BAR_ENEMYHP, COLOR_BAR_ENEMYHP_UNDER);
	}
}
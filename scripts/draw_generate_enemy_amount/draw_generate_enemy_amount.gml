//stage5以降の道が2本あるステージでどちらの道からどれだけ敵がでてくるか表示


if(global.stage >= 6){
	var spawner_x_left = o_enemyGenerateMgr.spawner_x[0];
	var spawner_y_left = o_enemyGenerateMgr.spawner_y[0];
	var left_spawner_number = 0;
	var spawner_x_top = o_enemyGenerateMgr.spawner_x[1];
	var spawner_y_top = o_enemyGenerateMgr.spawner_y[1];
	var top_spawner_number = 1;
}
if(global.stage = 5){//stage5だけ逆
	var spawner_x_top = o_enemyGenerateMgr.spawner_x[0];
	var spawner_y_top = o_enemyGenerateMgr.spawner_y[0];
	var top_spawner_number = 0;
	var spawner_x_left = o_enemyGenerateMgr.spawner_x[1];
	var spawner_y_left = o_enemyGenerateMgr.spawner_y[1];
	var left_spawner_number = 1;
}
if(global.stage <= 4){
	var spawner_x_left = o_enemyGenerateMgr.spawner_x[0];
	var spawner_y_left = o_enemyGenerateMgr.spawner_y[0];
	var left_spawner_number = 0;
	var top_spawner_number = -1;
}

//左
var offset_x = spawner_x_left+16;
var offset_y = spawner_y_left-12;
var offset_y2 = offset_y;//offset_y2は行の中心
if(left_spawner_number = 0){
	var spawner_generate_data = generate_enemy_spawner0;
}
else{
	var spawner_generate_data = generate_enemy_spawner1;
}
for(var i=0; i<array_length_1d(spawner_generate_data); i++){
	if(spawner_generate_data[i] != 0){
		offset_y2 -= 22;//左側は表示数が増えると上に伸びる
	}
}


draw_set_alpha(1);
draw_set_font(fo_kosugiMaru10Ja);
for(var i=0; i<array_length_1d(spawner_generate_data); i++){
	if(spawner_generate_data[i] != 0){//生成数がのこり0の敵は表示されない
		var enemy_number = global.spawn_enemy[i, spawnenemy.number];
		
		var rectangle_size = 16
		if(enemy_number = 3 or enemy_number = 4 or enemy_number = 5){
			rectangle_size = 10;//smallのみ四角を小さく
		}
		else if(enemy_number = 21 or enemy_number = 22 or enemy_number = 23){
			rectangle_size = 20;//boss
		}
		
		
		draw_set_color(global.enemydata[enemy_number, enemydata.color]);
		draw_rectangle(offset_x+12-rectangle_size/2, offset_y2-rectangle_size/2, offset_x+12+rectangle_size/2, offset_y2+rectangle_size/2, false);
		draw_set_color(COLOR_TEXT_LTGRAY);
		draw_set_valign(fa_middle);
		draw_text(offset_x+24, offset_y2, "x "+string(spawner_generate_data[i]));
		
		offset_y2 += 22;
	}
}


//上側
if(top_spawner_number != -1){
	var offset_x = spawner_x_top+16;
	var offset_y = spawner_y_top+30;
	var offset_y2 = offset_y;//offset_y2は行の中心
	if(top_spawner_number = 0){
		var spawner_generate_data = generate_enemy_spawner0;
	}
	else{
		var spawner_generate_data = generate_enemy_spawner1;
	}


	for(var i=0; i<array_length_1d(spawner_generate_data); i++){
		if(spawner_generate_data[i] != 0){//生成数がのこり0の敵は表示されない
			var enemy_number = global.spawn_enemy[i, spawnenemy.number];
		
			var rectangle_size = 16
			if(enemy_number = 3 or enemy_number = 4 or enemy_number = 5){
				rectangle_size = 10;//smallのみ四角を小さく
			}
			else if(enemy_number = 21 or enemy_number = 22 or enemy_number = 23){
				rectangle_size = 20;//boss
			}
		
		
			draw_set_color(global.enemydata[enemy_number, enemydata.color]);
			draw_rectangle(offset_x+12-rectangle_size/2, offset_y2-rectangle_size/2, offset_x+12+rectangle_size/2, offset_y2+rectangle_size/2, false);
			draw_set_color(COLOR_TEXT_LTGRAY);
			draw_set_valign(fa_middle);
			draw_text(offset_x+24, offset_y2, "x "+string(spawner_generate_data[i]));
		
			offset_y2 += 22;
		}
	}
}


draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_font(FONT_DEFAULT);



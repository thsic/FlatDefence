///@param enemyid
//敵パラメータの強さをランク分けする
var enemy_id = argument0;
var rank_name = "-";
var rank_color = 0;
var hp_rank = 0;
var shield_rank = 0;
var speed_rank = 0;
var rank_amount = ENEMY_RANK_AMOUNT;//10

#region rankdata
rank_color[0] = make_color_rgb(130, 200, 130);
rank_color[1] = make_color_rgb(140, 220, 140);
rank_color[2] = make_color_rgb(140, 220, 140);
rank_color[3] = make_color_rgb(160, 230, 155);
rank_color[4] = make_color_rgb(160, 230, 155);
rank_color[5] = make_color_rgb(120, 215, 170);
rank_color[6] = make_color_rgb(120, 215, 170);
rank_color[7] = make_color_rgb(130, 195, 250);
rank_color[8] = make_color_rgb(130, 195, 250);
rank_color[9] = make_color_rgb(235, 160, 250);
//ランク名前入れ
rank_name[0] = "D";
rank_name[1] = "C";
rank_name[2] = "C";
rank_name[3] = "B";
rank_name[4] = "B";
rank_name[5] = "A";
rank_name[6] = "A";
rank_name[7] = "S";
rank_name[8] = "S";
rank_name[9] = "SS";
//ランクステータス入れ
hp_rank[0] = 0;
hp_rank[1] = 25;
hp_rank[2] = 50;
hp_rank[3] = 150;
hp_rank[4] = 300;
hp_rank[5] = 550;
hp_rank[6] = 800;
hp_rank[7] = 1200;
hp_rank[8] = 2000;
hp_rank[9] = 3500;
shield_rank[0] = 0;
shield_rank[1] = 10;
shield_rank[2] = 25;
shield_rank[3] = 50;
shield_rank[4] = 75;
shield_rank[5] = 110;
shield_rank[6] = 160;
shield_rank[7] = 230;
shield_rank[8] = 510;
shield_rank[9] = 1000;
speed_rank[0] = 0;
speed_rank[1] = 0.3;
speed_rank[2] = 0.5;
speed_rank[3] = 1;
speed_rank[4] = 1.5;
speed_rank[5] = 2;
speed_rank[6] = 2.5;
speed_rank[7] = 3.5;
speed_rank[8] = 4;
speed_rank[9] = 5;
#endregion

for(var i=0; i<rank_amount; i++){
	if(global.enemydata[enemy_id, enemydata.hp] <= hp_rank[i]){
		global.enemydata[enemy_id, enemydata.hprank] = rank_name[i]
		global.enemydata[enemy_id, enemydata.hptextcolor] = rank_color[i];
		break
	}
}
for(var i=0; i<rank_amount; i++){
	if(global.enemydata[enemy_id, enemydata.shield] <= shield_rank[i]){
		global.enemydata[enemy_id, enemydata.shieldrank] = rank_name[i];
		global.enemydata[enemy_id, enemydata.shieldtextcolor] = rank_color[i]
		break
	}
}
for(var i=0; i<rank_amount; i++){
	if(global.enemydata[enemy_id, enemydata.speed] <= speed_rank[i]){
		global.enemydata[enemy_id, enemydata.speedrank] = rank_name[i];
		global.enemydata[enemy_id, enemydata.speedtextcolor] = rank_color[i]
		break
	}
}
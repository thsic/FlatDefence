//ステージごとの設定
//リセット
global.life = noone;
global.shop_defender = noone;
global.shop_item = noone;
for(var i=0; i<20; i++){
	global.wave_drop_item[i] = -1;
}

switch(global.stage){
case -1:
	global.life = 10;//体力
	global.gold = 1000;//おかね
	global.wave_total = 2;//総ウェーブ数
	global.wave_clear_gold = 50;//ウェーブクリア時の獲得ゴールド
	
	global.shop_defender[0] = o_dBasic;
	global.shop_defender[1] = o_dSniper;
	global.shop_defender[2] = o_dBomber;
	global.shop_defender[3] = o_dFreezer;
	global.shop_defender[4] = o_dBlaster;
	global.shop_defender[5] = o_dThief;
	global.shop_item[0] = 0;
	global.shop_item[1] = 1;
	global.shop_item[2] = 3;
	global.shop_item[3] = 23;
	global.shop_item[4] = 7;
	global.shop_item[5] = 9;
	global.shop_item[6] = 11;
	global.shop_item[7] = 13;
	global.shop_item[8] = 15;
	global.shop_item[9] = 17;
	global.shop_item[10] = 19;
	global.shop_item[11] = 21;
	global.shop_item[12] = 25;
	global.shop_item[13] = 27;
	
	global.wave_drop_item[1] = 0;
	//global.wave_drop_item[1] = 3;
	
break
case 0:
	global.life = 10//体力
	global.gold = 1000;//おかね
	global.wave_total = 5;//総ウェーブ数

	global.shop_defender[0] = o_dBasic;
	global.shop_item[0] = 0;

	
break
case 1:
	global.life = 10//体力
	global.gold = 300;//おかね
	global.wave_total = 6;//総ウェーブ数
	global.wave_clear_gold = 50;//ウェーブクリア時の獲得ゴールド

	global.shop_defender[0] = o_dBasic;
	global.shop_defender[1] = o_dSniper;
	global.shop_item[0] = 1;
	global.shop_item[1] = 9;
	global.shop_item[2] = 19;
	
	global.wave_drop_item[2] = 1;
	global.wave_drop_item[4] = 19;
break
case 2:
	global.life = 10//体力
	global.gold = 300;//おかね
	global.wave_total = 7;//総ウェーブ数
	global.wave_clear_gold = 50;//ウェーブクリア時の獲得ゴールド

	global.shop_defender[0] = o_dBasic;
	global.shop_defender[1] = o_dSniper;
	global.shop_defender[2] = o_dBomber;
	global.shop_defender[3] = o_dThief;
	global.shop_item[0] = 1;
	global.shop_item[1] = 9;
	global.shop_item[2] = 19;
	global.shop_item[3] = 3;
	global.shop_item[4] = 25;
	global.shop_item[5] = 27;
	
	
	global.wave_drop_item[2] = 17;
	global.wave_drop_item[3] = 13;
	global.wave_drop_item[4] = 21;
	global.wave_drop_item[6] = 0;
break
case 3:
	global.life = 10;
	global.gold = 500;
	global.wave_total = 6;
	global.wave_clear_gold = 150;
	
	global.shop_defender[0] = o_dBasic;
	global.shop_defender[1] = o_dSniper;
	global.shop_defender[2] = o_dBomber;
	global.shop_defender[3] = o_dThief;
	global.shop_defender[4] = o_dFreezer;
	global.shop_item[0] = 0;
	global.shop_item[1] = 1;
	global.shop_item[2] = 9;
	global.shop_item[3] = 3;
	global.shop_item[4] = 25;
	global.shop_item[5] = 27;
	global.shop_item[6] = 13;
	global.shop_item[7] = 21;
	global.shop_item[8] = 17;
	
	global.wave_drop_item[1] = 17;
	global.wave_drop_item[2] = 0;
	global.wave_drop_item[3] = 23;
	global.wave_drop_item[4] = 0;
	global.wave_drop_item[5] = 0;
break
case 4:
	global.life = 10;
	global.gold = 750;
	global.wave_total = 4;
	global.wave_clear_gold = 100;
	
	global.shop_defender[0] = o_dBasic;
	global.shop_defender[1] = o_dSniper;
	global.shop_defender[2] = o_dBomber;
	global.shop_defender[3] = o_dThief;
	global.shop_defender[4] = o_dFreezer;
	global.shop_defender[5] = o_dBlaster;
	global.shop_item[0] = 0;
	global.shop_item[1] = 1;
	global.shop_item[2] = 9;
	global.shop_item[3] = 3;
	global.shop_item[4] = 25;
	global.shop_item[5] = 27;
	global.shop_item[6] = 21;
	global.shop_item[7] = 17;
	global.shop_item[8] = 23;
	
	global.wave_drop_item[1] = 17;
	global.wave_drop_item[2] = 0;
	global.wave_drop_item[3] = 23;
break
default:
	global.life = 1
	global.gold = 50;
	global.wave_total = 1;
	global.shop_defender[0] = o_dBasic;
	global.shop_item[0] = 0;
	sdm("error! stage_setting")
break
}

global.shop_defender_amount = array_length_1d(global.shop_defender);
global.shop_item_amount = array_length_1d(global.shop_item);

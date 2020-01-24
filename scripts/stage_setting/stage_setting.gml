//ステージごとの設定
//リセット
global.life = noone;
global.shop_defender = noone;
global.shop_item = noone;

switch(global.stage){
case -1:
	global.life = 10//体力
	global.gold = 1000;//おかね
	global.wave_total = 2;//総ウェーブ数
	
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
	
	
break
case 0:
	global.life = 10//体力
	global.gold = 1000;//おかね
	global.wave_total = 5;//総ウェーブ数

	global.shop_defender[0] = o_dBasic;
	global.shop_defender[1] = o_dSniper;
	global.shop_item[0] = 0;
	global.shop_item[1] = 1;
	global.shop_item[2] = 7;
	
break
case 1:
	global.life = 10//体力
	global.gold = 1000;//おかね
	global.wave_total = 5;//総ウェーブ数

	global.shop_defender[0] = o_dBasic;
	global.shop_defender[1] = o_dSniper;
	global.shop_item[0] = 0;
	global.shop_item[1] = 1;
	global.shop_item[2] = 7;

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

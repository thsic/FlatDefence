//ステージごとの設定
//リセット
global.life = noone;
global.shop_defender = noone;
global.shop_item = noone;

switch(global.stage){
case 0:
	global.life = 10//体力
	global.gold = 1000;//おかね
	
	global.shop_defender[0] = o_dBasic;
	global.shop_defender[1] = o_dSniper;
	global.shop_defender[2] = o_dBasic;
	global.shop_item[0] = 0;
	global.shop_item[1] = 1;
	global.shop_item[2] = 3;
	global.shop_item[3] = 5;
	
break
	
case other:
	global.life = 1
	global.shop_defender[0] = o_dBasic;
	global.shop_item[0] = 0;
	sdm("error! stage_setting")
}

global.shop_defender_amount = array_length_1d(global.shop_defender);
global.shop_item_amount = array_length_1d(global.shop_item);

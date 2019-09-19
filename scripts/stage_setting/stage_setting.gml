//ステージごとの設定
//リセット
global.life = noone;
global.shop_defender = noone;
global.shop_item = noone;
switch(room){
case r_test:
	global.life = 10
	
	global.shop_defender[0] = o_dBasic;
	global.shop_defender[1] = o_dSniper;
	global.shop_item[0] = 0;
	global.shop_item[1] = 1;
	
break
	
case other:
	global.life = 1
	global.shop_defender[0] = o_dBasic;
	global.shop_item[0] = 0;
	sdm("error! stage_setting")
}

global.shop_defender_amount = array_length_1d(global.shop_defender);
global.shop_item_amount = array_length_1d(global.shop_item);
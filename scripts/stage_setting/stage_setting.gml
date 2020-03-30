//ステージごとの設定
//リセット
global.life = noone;
global.shop_defender = noone;
global.shop_item = noone;
for(var i=0; i<20; i++){
	global.wave_drop_item[i] = -1;
}

switch(global.stage){
#region teststage
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
	global.shop_item[14] = 29;
	
	global.wave_drop_item[1] = 0;
	//global.wave_drop_item[1] = 3;
	set_shop_item_gold_fill();
	for(var i=0; i<15; i++){
		set_shop_item_gold(i, "=", 10);
	}
break
case 0:
	global.life = 10//体力
	global.gold = 1000;//おかね
	global.wave_total = 5;//総ウェーブ数

	global.shop_defender[0] = o_dBasic;
	global.shop_item[0] = 0;
	set_shop_item_gold_fill();
	
break
#endregion
#region stage1
case 1:
	//最初のステージなので簡単 
	//アイテムの重要性をつたえる
	//
	
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
	
	set_shop_item_gold_fill();
	set_shop_item_gold(0, "/", 2);
	set_shop_item_gold(1, "/", 2);
	set_shop_item_gold(2, "/", 2);
	
break
#endregion
#region stage2
case 2:
	//ラッシュ面
	//
	
	global.life = 10//体力
	global.gold = 300;//おかね
	global.wave_total = 7;//総ウェーブ数
	global.wave_clear_gold =75;//ウェーブクリア時の獲得ゴールド

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
	set_shop_item_gold_fill();
break
#endregion
#region stage3
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
	
	set_shop_item_gold_fill();
	
break
#endregion
#region stage4
case 4:
	global.life = 10;
	global.gold = 700;
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
	global.shop_item[2] = 19;
	global.shop_item[3] = 3;
	global.shop_item[4] = 25;
	global.shop_item[5] = 27;
	global.shop_item[6] = 21;
	global.shop_item[7] = 17;
	global.shop_item[8] = 23;
	
	global.wave_drop_item[1] = 17;
	global.wave_drop_item[2] = 0;
	global.wave_drop_item[3] = 23;
	
	set_shop_item_gold_fill();
break
#endregion
#region stage5
case 5:
	global.life = 20;
	global.gold = 600;
	global.wave_total = 6;
	global.wave_clear_gold = 50;
	
	global.shop_defender[0] = o_dBasic;
	global.shop_defender[1] = o_dSniper;
	global.shop_defender[2] = o_dBomber;
	global.shop_defender[3] = o_dThief;
	global.shop_defender[4] = o_dFreezer;
	global.shop_defender[5] = o_dBlaster;
	global.shop_item[0] = 0;
	global.shop_item[1] = 1;
	global.shop_item[2] = 19;
	global.shop_item[3] = 3;
	global.shop_item[4] = 25;
	global.shop_item[5] = 27;
	global.shop_item[6] = 21;
	global.shop_item[7] = 17;
	global.shop_item[8] = 23;
	
	global.wave_drop_item[1] = 19;
	global.wave_drop_item[2] = 23;
	global.wave_drop_item[3] = 21;
	global.wave_drop_item[4] = 11;
	global.wave_drop_item[5] = 25;
	
	set_shop_item_gold_fill();
	set_shop_item_gold(0, "=", 100);
	set_shop_item_gold(1, "=", 40);
	set_shop_item_gold(5, "=", 170);
	set_shop_item_gold(6, "=", 110);
	set_shop_item_gold(7, "=", 150);
break
#endregion
#region stage6
case 6:
	global.life = 10;
	global.gold = 600;
	global.wave_total = 7;
	global.wave_clear_gold = 0;
	
	global.shop_defender[0] = o_dBasic;
	global.shop_defender[1] = o_dSniper;
	global.shop_defender[2] = o_dBomber;
	global.shop_defender[3] = o_dThief;
	global.shop_defender[4] = o_dFreezer;
	global.shop_defender[5] = o_dBlaster;
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
	
	global.wave_drop_item[1] = 7;
	global.wave_drop_item[2] = 11;
	global.wave_drop_item[3] = 23;
	global.wave_drop_item[5] = 21;
	global.wave_drop_item[6] = 0;
	
	set_shop_item_gold_fill();
break
#endregion
#region stage7
case 7:
	global.life = 10;
	global.gold = 600;
	global.wave_total = 7;
	global.wave_clear_gold = 150;
	
	global.shop_defender[0] = o_dBasic;
	global.shop_defender[1] = o_dSniper;
	global.shop_defender[2] = o_dBomber;
	global.shop_defender[3] = o_dThief;
	global.shop_defender[4] = o_dFreezer;
	global.shop_defender[5] = o_dBlaster;
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
	
	global.wave_drop_item[1] = 27;
	global.wave_drop_item[2] = 9;
	global.wave_drop_item[4] = 17;
	global.wave_drop_item[5] = 13;
	global.wave_drop_item[6] = 0;
	set_shop_item_gold_fill();
break
#endregion
#region stage8
case 8:
	global.life = 5;
	global.gold = 700;
	global.wave_total = 9;
	global.wave_clear_gold = 200;
	
	global.shop_defender[0] = o_dBasic;
	global.shop_defender[1] = o_dSniper;
	global.shop_defender[2] = o_dBomber;
	global.shop_defender[3] = o_dThief;
	global.shop_defender[4] = o_dFreezer;
	global.shop_defender[5] = o_dBlaster;
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
	
	global.wave_drop_item[1] = 1;
	global.wave_drop_item[2] = 23;
	global.wave_drop_item[3] = 25;
	global.wave_drop_item[4] = 0;
	global.wave_drop_item[5] = 11;
	global.wave_drop_item[6] = 17;
	global.wave_drop_item[7] = 21;
	global.wave_drop_item[8] = 23;
	
	set_shop_item_gold_fill();
break
#endregion
#region default
default:
	global.life = 1
	global.gold = 50;
	global.wave_total = 1;
	global.shop_defender[0] = o_dBasic;
	global.shop_item[0] = 1;
	set_shop_item_gold_fill();
	sdm("error! stage_setting")
	
break
#endregion
}

global.shop_defender_amount = array_length_1d(global.shop_defender);
global.shop_item_amount = array_length_1d(global.shop_item);

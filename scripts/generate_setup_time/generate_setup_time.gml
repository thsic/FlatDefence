//タイムライン関連の設定
global.generate_timeline_id = timeline_add();
timeline_index = global.generate_timeline_id;
timeline_running = true;

//敵の数データリセット
global.enemy_wave_total_amount = 0;
for(var i=0; i<SPAWN_ENEMY_TYPE_AMOUNT; i++){
	global.spawn_enemy[i, spawnenemy.amount] = 0;
	global.spawn_enemy[i, spawnenemy.objectid] = -1;
}

//敵出現時間指定 ルームとかウェーブごとにいちいち設定しよう！
//最低でも4f開けないとバグる

switch(global.stage){
#region stage-1 (teststage)
case -1:
	switch(global.wave_now){
	case 1:
		for(var i=1; i<=3; i++){
			for(var l=1; l<=12; l++){
				set_enemy_generate_timeline(i*300+l*15, global.generate_timeline_id, 0, 0, 0);
			}
		}
	break
	case 2:
		for(var i=1; i<=3; i++){
			for(var l=1; l<=5; l++){
				set_enemy_generate_timeline(i*150+l*15, global.generate_timeline_id, 0, 0, 0);
			}
		}
		for(var i=1; i<=3; i++){
			for(var l=1; l<=5; l++){
				set_enemy_generate_timeline(i*150+l*15+5*150, global.generate_timeline_id, 0, 1, 0);
			}
		}
	break
	}
	
break
#endregion -----------------
#region stage1
case 1:
	switch(global.wave_now){
	case 1://敵10体
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*60, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 2://fast*3 Small*7 Fast*7
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*30, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<7; i++){
			set_enemy_generate_timeline(i*60+90, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<7; i++){
			set_enemy_generate_timeline(i*45+510, global.generate_timeline_id, 0, 1, 0);
		}
	break
	case 3://Normal*3 Normal*3 Normal*3
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+180, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+420, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 4://NormalLv2*1 NormalLv1*3 NormalLv2*1 NormalLv1*3
		set_enemy_generate_timeline(0, global.generate_timeline_id, 0, 1, 0);
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*45+80, global.generate_timeline_id, 0, 0, 0);
		}
		set_enemy_generate_timeline(215+60, global.generate_timeline_id, 0, 1, 0);
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*45+355, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 5://Normal Small*4 Small*6 Normal
		set_enemy_generate_timeline(0, global.generate_timeline_id, 0, 1, 0);
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*30+60, global.generate_timeline_id, 0, 0, 0);
		}
		set_enemy_generate_timeline(360, global.generate_timeline_id, 0, 1, 0);
		for(var i=0; i<12; i++){
			set_enemy_generate_timeline(i*30+360+30, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 6://NormalLv2*5 NormalLv3*3 NormalLv2&Lv3*5
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*60+60, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+180+360, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*60+990+30, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*60+990, global.generate_timeline_id, 0, 1, 0);
		}
	break
	}
break
#endregion
#region stage2
case 2:
switch(global.wave_now){
	case 1://Small*16
		for(var i=0; i<16; i++){
			set_enemy_generate_timeline(i*30, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 2://Small*10 Normal*5 Small*15
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*20, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+250, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*15+450, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*15+550, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*15+650, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 3://Normal*5 Small*10 Fast*5 Small*10 Normal*5 Fast*10
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*20, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*20+140, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+380, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*30+550, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*15+870, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*10+1000, global.generate_timeline_id, 0, 2, 0);
		}
	break
	case 4://Shield*2  Normal&Fast*5 Shield*3 Normal*5 Fast*5
		for(var i=0; i<2; i++){
			set_enemy_generate_timeline(i*45, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+120, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*30+120+15, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+320, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+560, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+740, global.generate_timeline_id, 0, 1, 0);
		}
	break
	case 5://Shield*3 *3
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*45, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*30+230, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*30+400, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 6://Fast*3 Normal*10 Small*10 Fast*5 Small&Normal*5
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*30, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*10+120, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*10+230, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*10+360, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*20+440, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*20+440+120, global.generate_timeline_id, 0, 1, 0);
		}
	break
	case 7://Normal*5 Normal*10 Fast*5 Shield*5 Normal*10 Fast*5 
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*20+180, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+400, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+600, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*15+780, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+950, global.generate_timeline_id, 0, 2, 0);
		}
	break
	}
break
#endregion
#region stage3
case 3:
	switch(global.wave_now){
	case 1://Shield*1 Normal*5 Small*10 Shield*3 Normal*10 
		set_enemy_generate_timeline(0, global.generate_timeline_id, 0, 2, 0);
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+10, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*40+200, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+700, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*30+900, global.generate_timeline_id, 0, 1, 0);
		}
	break
	case 2://Tough*3 Small*5 Tough*2 Small*10 Fast*5
		for(var i=0; i<2; i++){
			set_enemy_generate_timeline(i*60, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+210, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+420, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*30+630, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+960, global.generate_timeline_id, 0, 1, 0);
		}
	break
	case 3://Shield*2 Tough*1 Shield*5 Tough*3
		for(var i=0; i<2; i++){
			set_enemy_generate_timeline(i*30, global.generate_timeline_id, 0, 0, 0);
		}
		set_enemy_generate_timeline(210, global.generate_timeline_id, 0, 1, 0);
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*45+270, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*60+560, global.generate_timeline_id, 0, 1, 0);
		}
	break
	case 4://Normal*4 Normal&Small*5 Small*5 Fast*8 
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*30, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+135, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*30+135+15, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*15+300, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<8; i++){
			set_enemy_generate_timeline(i*15+410, global.generate_timeline_id, 0, 2, 0);
		}
	break
	case 5://Small*5 Tough*3 Small&Tough*5 Fast*7 Small*12
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*20, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<2; i++){
			set_enemy_generate_timeline(i*90+120, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*90+300, global.generate_timeline_id, 0, 2, 0);
			set_enemy_generate_timeline(i*90+300+45, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<7; i++){
			set_enemy_generate_timeline(i*30+820, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<12; i++){
			set_enemy_generate_timeline(i*20+1060, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 6://Normal*7 Tough*3 Normal*3 Shield*3 Normal&Small*7 Small*12 Normal&Small*8 Small*5 Small*18 Small&Normal*10
		for(var i=0; i<7; i++){
			set_enemy_generate_timeline(i*25, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+200, global.generate_timeline_id, 0, 3, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*30+410, global.generate_timeline_id, 0, 1, 0);
		}
		
		for(var i=0; i<7; i++){
			set_enemy_generate_timeline(i*40+560, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*40+560+20, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+860, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<12; i++){
			set_enemy_generate_timeline(i*15+1140, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<8; i++){
			set_enemy_generate_timeline(i*30+1335, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*30+1335+15, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*10+1615, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<18; i++){
			set_enemy_generate_timeline(i*15+1750, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*30+2100, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*30+2100+15, global.generate_timeline_id, 0, 0, 0);
		}
	break
	}
break
#endregion
#region stage4
case 4:
	switch(global.wave_now){
	case 1://shield2*2 Normal*4 shield1*5 Normal*5 Normal*5
		for(var i=0; i<2; i++){
			set_enemy_generate_timeline(i*60+10, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*30+210, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*45+310, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+600, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+800, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 2://Tough2*2 Tough3*1 Tough1*3 Tough2*2 Tough1*2
		for(var i=0; i<2; i++){
			set_enemy_generate_timeline(i*90+10, global.generate_timeline_id, 0, 1, 0);
		}
		set_enemy_generate_timeline(280, global.generate_timeline_id, 0, 2, 0);
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*70+360, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<2; i++){
			set_enemy_generate_timeline(i*100+760, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<2; i++){
			set_enemy_generate_timeline(i*100+1060, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 3://Normal*4 Tough*2 Normal*3 Tough*3 Shield*3 Tough*2 Shield*4 Normal*4
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*30+10, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<2; i++){
			set_enemy_generate_timeline(i*80+180, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*40+420, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*90+610, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*70+860, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<2; i++){
			set_enemy_generate_timeline(i*90+1130, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*90+1400, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*40+1800, global.generate_timeline_id, 0, 0, 0);
		}
		
	break
	case 4://Small*5*2 Shield*3 Normal*4 Small*5*3 Shield*3 Small*5*2 Normal*4 Shield*3 Normal*4 Tough*3 Small*5*4 
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*10+5, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+100, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+200, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*20+450, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*10+600, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+700, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+800, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+900, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*10+1130, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+1230, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*20+1330, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+1430, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*20+1600, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*80+1740, global.generate_timeline_id, 0, 3, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*10+2100, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+2200, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+2300, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+2400, global.generate_timeline_id, 0, 0, 0);
		}
	break
	}
break
#endregion
#region stage5
case 5:
	switch(global.wave_now){
	case 1://berserker small*3 small*3 normal berserker 
		set_enemy_generate_timeline(30, global.generate_timeline_id, 0, 2, 0);
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*30+120, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*30+130, global.generate_timeline_id, 0, 1, 0);
		}
		set_enemy_generate_timeline(300, global.generate_timeline_id, 1, 1, 1);
		set_enemy_generate_timeline(420, global.generate_timeline_id, 0, 2, 0);
	break
	case 2://normal small*3 fast*5 small*3*2 normal fast*3
		set_enemy_generate_timeline(30, global.generate_timeline_id, 1, 1, 1);
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*30+60, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*30+360, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*30+480, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*30+580, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*40+180, global.generate_timeline_id, 0, 2, 0);
		}
		set_enemy_generate_timeline(570, global.generate_timeline_id, 1, 1, 1);
	break
	case 3://small1*5 small2*3 shield small2*3 small1*5*2 shield small1*5
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*15+30, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*15+370, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*15+490, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*15+630, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*30+130, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*30+250, global.generate_timeline_id, 0, 1, 0);
		}
		set_enemy_generate_timeline(240, global.generate_timeline_id, 1, 2, 1);
		set_enemy_generate_timeline(620, global.generate_timeline_id, 1, 2, 1);
	break
	case 4://shield small*5*3 shield small*5*2 shield small*3*3
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*40+20, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*40+300, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*40+580, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*40+650, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*40+930, global.generate_timeline_id, 0, 0, 0);
		}
		set_enemy_generate_timeline(50, global.generate_timeline_id, 1, 1, 1);
		set_enemy_generate_timeline(590, global.generate_timeline_id, 1, 1, 1);
		set_enemy_generate_timeline(910, global.generate_timeline_id, 1, 1, 1);
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*20+1200, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*20+1380, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*20+1470, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 5://small2 small2*5 berserker (shield small2*3) berserker*3 (shield small2*3) small2*7
		set_enemy_generate_timeline(10, global.generate_timeline_id, 1, 0, 1);//した
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*20+30, global.generate_timeline_id, 0, 0, 0);
		}
		set_enemy_generate_timeline(190, global.generate_timeline_id, 0, 1, 0);
		set_enemy_generate_timeline(200, global.generate_timeline_id, 1, 2, 1);
		for(var i=0; i<3; i++){//下
			set_enemy_generate_timeline(i*30+230, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*30+630, global.generate_timeline_id, 1, 0, 1);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*90+300, global.generate_timeline_id, 0, 1, 0);
		}
		set_enemy_generate_timeline(600, global.generate_timeline_id, 1, 2, 1);
		for(var i=0; i<7; i++){
			set_enemy_generate_timeline(i*20+730, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 6://fast*20 (shield) small*5 berserker small*5*3 (shield small*3) small*5 berserker*3 small*5*2 (shield small*3) small*5*3 berserker*3 (shield)
		for(var i=0; i<50; i++){
			set_enemy_generate_timeline(i*30+5, global.generate_timeline_id, 0, 1, 0);//1
		}
		for(var i=0; i<5; i++){//small
			set_enemy_generate_timeline(i*20+50, global.generate_timeline_id, 0, 0, 0);//3
			for(var j=0; j<3; j++){
				set_enemy_generate_timeline(i*20+210+j*160, global.generate_timeline_id, 0, 0, 0);//5
				set_enemy_generate_timeline(i*20+1300+j*160, global.generate_timeline_id, 0, 0, 0);//13
			}
			set_enemy_generate_timeline(i*20+660, global.generate_timeline_id, 0, 0, 0);//8
			set_enemy_generate_timeline(i*20+1010, global.generate_timeline_id, 0, 0, 0);//10
			set_enemy_generate_timeline(i*20+1180, global.generate_timeline_id, 0, 0, 0);//10
		}
		
		//berserker
		set_enemy_generate_timeline(180, global.generate_timeline_id, 0, 2, 0);//4
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*70+800, global.generate_timeline_id, 0, 2, 0);//9
			set_enemy_generate_timeline(i*60+1730, global.generate_timeline_id, 0, 2, 0);//14
		}
		
		//sita
		set_enemy_generate_timeline(30, global.generate_timeline_id, 1, 3, 1);//2
		set_enemy_generate_timeline(640, global.generate_timeline_id, 1, 3, 1);//6
		set_enemy_generate_timeline(1160, global.generate_timeline_id, 1, 3, 1);//11
		set_enemy_generate_timeline(1670, global.generate_timeline_id, 1, 3, 1);//15
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*40+730, global.generate_timeline_id, 1, 0, 1);//7
			set_enemy_generate_timeline(i*40+1250, global.generate_timeline_id, 1, 0, 1);//12
		}
		
	break
	}
break
#endregion
#region stage6
case 6:
	switch(global.wave_now){
	case 1://(regen*3) small*5*2 (regen*3) small*5
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*80+30, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*80+350, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*20+200, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*20+460, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*20+720, global.generate_timeline_id, 1, 0, 1);
		}
	break
	case 2://tough (regen) tough tough (regen*3) (regen*3)
		set_enemy_generate_timeline(30, global.generate_timeline_id, 1, 0, 1);
		set_enemy_generate_timeline(60, global.generate_timeline_id, 0, 1, 0);
		set_enemy_generate_timeline(180, global.generate_timeline_id, 1, 0, 1);
		set_enemy_generate_timeline(300, global.generate_timeline_id, 1, 0, 1);
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+250, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*60+500, global.generate_timeline_id, 0, 1, 0);
		}
	break
	case 3://tough (shield) small*3 tough (shield) small*3 (shield) small*3 
		set_enemy_generate_timeline(30, global.generate_timeline_id, 1, 2, 1);
		set_enemy_generate_timeline(40, global.generate_timeline_id, 0, 1, 0);
		set_enemy_generate_timeline(260, global.generate_timeline_id, 0, 1, 0);
		set_enemy_generate_timeline(270, global.generate_timeline_id, 1, 2, 1);
		set_enemy_generate_timeline(380, global.generate_timeline_id, 1, 2, 1);
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+100, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*60+360, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*60+580, global.generate_timeline_id, 1, 0, 1);
		}
	break
	case 4://berserker*4 (regen*3) berserker*6 (regen*3) berserker*4*2
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*60+30, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*60+750, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*60+1140, global.generate_timeline_id, 1, 0, 1);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*80+100, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*80+640, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<6; i++){
			set_enemy_generate_timeline(i*60+270, global.generate_timeline_id, 1, 0, 1);
		}
	break
	case 5://tough (normal*3*2) tough small*5 (normal*3) small*5
		set_enemy_generate_timeline(30, global.generate_timeline_id, 1, 2, 1);
		set_enemy_generate_timeline(410, global.generate_timeline_id, 1, 2, 1);
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+460, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*30+700, global.generate_timeline_id, 1, 0, 1);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*40+40, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*40+240, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*30+470, global.generate_timeline_id, 0, 1, 0);
		}
	break
	case 6://r3 r1*4*2 r3 r1*4 r3 r1*4 r2*3*3  
		set_enemy_generate_timeline(30, global.generate_timeline_id, 0, 2, 0);
		set_enemy_generate_timeline(640, global.generate_timeline_id, 0, 2, 0);
		set_enemy_generate_timeline(940, global.generate_timeline_id, 0, 2, 0);
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*40+60, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*40+300, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*40+700, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*40+1000, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*50+1250, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*50+1450, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*50+1650, global.generate_timeline_id, 0, 1, 0);
		}
	break
	case 7://boss (regen) fast*3 normal*5*2 (regen*3) fast*3 normal*5 (regen*3) normal*5 fast*3*2 (regen) fast*3
		set_enemy_generate_timeline(30, global.generate_timeline_id, 1, 3, 1);
		set_enemy_generate_timeline(40, global.generate_timeline_id, 0, 2, 0);
		set_enemy_generate_timeline(1860, global.generate_timeline_id, 0, 2, 0);
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*40+60, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*40+780, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*40+1520, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*40+1720, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*40+1960, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*60+570, global.generate_timeline_id, 0, 2, 0);
			set_enemy_generate_timeline(i*60+1100, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+200, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*30+410, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*30+930, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*30+1310, global.generate_timeline_id, 1, 0, 1);
		}
	break
	}
break
#endregion
#region stage7
case 7:
	switch(global.wave_now){
	case 1://fast*5 (small*3) fast*5*2 (small*3) fast*5
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*20+40, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*20+220, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*20+380, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*20+540, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*40+30, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*40+390, global.generate_timeline_id, 1, 0, 1);
		}
	break
	case 2://small*5*2 berserker*4 (Normal*3*2) small*5 berserker*4 (normal*3*2) small*5
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*20+40, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*20+200, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*20+580, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*20+980, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*60+340, global.generate_timeline_id, 0, 2, 0);
			set_enemy_generate_timeline(i*60+740, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*30+345, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*30+495, global.generate_timeline_id, 1, 2, 1);
			set_enemy_generate_timeline(i*30+745, global.generate_timeline_id, 1, 2, 1);
			set_enemy_generate_timeline(i*30+895, global.generate_timeline_id, 1, 2, 1);
		}
	break
	case 3://(shield*20 small*5) fast*5 small*5*3 fast*5 small*5*2 (small*5)
		for(var i=0; i<15; i++){
			set_enemy_generate_timeline(i*60+35, global.generate_timeline_id, 1, 2, 1);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*20+50, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*20+1050, global.generate_timeline_id, 1, 0, 1);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*40+60, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*20+300, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*20+460, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*20+620, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*40+760, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*20+1000, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*20+1160, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 4://(regen*8) fast*8 normal*8*2 fast*8*2 normal*8
		for(var i=0; i<8; i++){
			set_enemy_generate_timeline(i*90+35, global.generate_timeline_id, 1, 2, 1);
		}
		for(var i=0; i<8; i++){
			set_enemy_generate_timeline(i*20+30, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*10+230, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+400, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*20+560, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*20+960, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*10+705, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 5://small*5*3 (normal*3*2 small*5*2) normal*5 small*5*3 (normal*3*2) small*5*2 (normal*3)
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*10+50, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+130, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+210, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*30+340, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*10+500, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+620, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+740, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+900, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+1020, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*30+55, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*30+225, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*30+785, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*30+945, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*30+1125, global.generate_timeline_id, 1, 1, 1);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*10+375, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*10+455, global.generate_timeline_id, 1, 0, 1);
		}
	break
	case 6://regen*6 (berserker*4) normal*3*2 berserker*4 (regen*6) normal*9 berserker*4
		for(var i=0; i<6; i++){
			set_enemy_generate_timeline(i*30+10, global.generate_timeline_id, 0, 2, 0);
			set_enemy_generate_timeline(i*30+545, global.generate_timeline_id, 1, 2, 1);
		}
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*60+85, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*60+540, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*60+1130, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*30+220, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*30+380, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<9; i++){
			set_enemy_generate_timeline(i*30+800, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 7://boss (berserker*4) small*8*2 berserker*4 (boss) small*8*3 (regen*5*2 small*10) small*8*2 (regen*5*2 small*5*2) berserker*4 small*8
		set_enemy_generate_timeline(5, global.generate_timeline_id, 0, 3, 0);
		set_enemy_generate_timeline(805, global.generate_timeline_id, 1, 3, 1);
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*40+35, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*40+260, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*30+1480, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<8; i++){
			set_enemy_generate_timeline(i*10+10, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+150, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+500, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+650, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+800, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+950, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+1200, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+1350, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+1620, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+1730, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+955, global.generate_timeline_id, 1, 2, 1);
			set_enemy_generate_timeline(i*30+1195, global.generate_timeline_id, 1, 2, 1);
			set_enemy_generate_timeline(i*30+1575, global.generate_timeline_id, 1, 2, 1);
		}
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*30+1205, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*30+1585, global.generate_timeline_id, 1, 0, 1);
		}
	break
	}
break
#endregion
#region stage8
case 8:

	switch(global.wave_now){
	case 1://small*5 (normal*5) normal*3 small*5
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+330, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*40+30, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*60+35, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*30+430, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 2://tough (tough) normal*3*2 (normal*5)
		set_enemy_generate_timeline(30, global.generate_timeline_id, 0, 1, 0);
		set_enemy_generate_timeline(40, global.generate_timeline_id, 1, 1, 1);
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+90, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*60+390, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*40+395, global.generate_timeline_id, 1, 0, 1);
		}
	break
	case 3://(fast*5) berserker*4 berserker*4 fast*3 (fast*3)
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*60+35, global.generate_timeline_id, 1, 0, 1);
		}
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*60+40, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*60+400, global.generate_timeline_id, 0, 1, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*40+525, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*40+655, global.generate_timeline_id, 1, 0, 1);
		}
	break
	case 4://tough*3 (regen*3 tough) regen*3 
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+30, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*60+35, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*50+285, global.generate_timeline_id, 0, 1, 0);
		}
		set_enemy_generate_timeline(170, global.generate_timeline_id, 1, 0, 1);
		
	break
	case 5://berserker*4*2 (shield*3 normal*6) normal*6 
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*50+50, global.generate_timeline_id, 0, 2, 0);
			set_enemy_generate_timeline(i*50+350, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+65, global.generate_timeline_id, 1, 1, 1);
		}
		for(var i=0; i<6; i++){
			set_enemy_generate_timeline(i*30+175, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*30+435, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 6://(regen*3 fast*5) regen*3 normal*5 fast*5*2 normal*5*2 fast*5
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*60+35, global.generate_timeline_id, 1, 2, 1);
			set_enemy_generate_timeline(i*60+60, global.generate_timeline_id, 0, 2, 0);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*20+145, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*20+310, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*20+560, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*20+720, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*20+930, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*20+1180, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*20+1330, global.generate_timeline_id, 0, 1, 0);
		}
	break
	case 7://fast*5*2 small*8 (fast*5 normal*5) small*8*2 (normal*5*2) small*8 fast*5*2 (fast*5*2 normal*5) small*8 small*8*2
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*10+0, global.generate_timeline_id, 0, 2, 0);
			set_enemy_generate_timeline(i*10+110, global.generate_timeline_id, 0, 2, 0);
			set_enemy_generate_timeline(i*10+60, global.generate_timeline_id, 1, 2, 1);
			set_enemy_generate_timeline(i*20+180, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*20+360, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*20+500, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*10+620, global.generate_timeline_id, 0, 2, 0);
			set_enemy_generate_timeline(i*10+700, global.generate_timeline_id, 0, 2, 0);
			set_enemy_generate_timeline(i*10+800, global.generate_timeline_id, 1, 2, 1);
			set_enemy_generate_timeline(i*10+930, global.generate_timeline_id, 1, 2, 1);
			set_enemy_generate_timeline(i*20+1050, global.generate_timeline_id, 1, 1, 1);
		}
		for(var i=0; i<8; i++){
			set_enemy_generate_timeline(i*10+205, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+355, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+505, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+655, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+805, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+955, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+1105, global.generate_timeline_id, 0, 0, 0);
		}
	break
	case 8://small*20 (small*20) berserker2*4*2 (berserker3*4) berserker2*4 (small*20 berserker3*4*2 small*20)
		for(var i=0; i<20; i++){
			set_enemy_generate_timeline(i*10+655, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+25, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*10+1205, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*10+1805, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<4; i++){
			set_enemy_generate_timeline(i*40+20, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*40+300, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*40+600, global.generate_timeline_id, 1, 2, 1);
			set_enemy_generate_timeline(i*40+800, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*40+1060, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*60+1420, global.generate_timeline_id, 1, 2, 1);
			set_enemy_generate_timeline(i*60+1700, global.generate_timeline_id, 1, 2, 1);
		}
	break
	case 9://(boss) shield*10 regen*5*2 (normal*5*2 fast*10) fast*10 /1000/ normal*10 (normal*10*2 fast*10) regen*3*2 /1500/ (normal*10 fast*10*2)   
		// /2000/ shield*5*2 (fast*10) regen*5 (normal*10 fast*10) normal*5*4
		set_enemy_generate_timeline(10, global.generate_timeline_id, 1, 4, 1);
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*30+20, global.generate_timeline_id, 0, 2, 0);
			set_enemy_generate_timeline(i*20+405, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*20+760, global.generate_timeline_id, 0, 1, 0);
			set_enemy_generate_timeline(i*10+1000, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+1055, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*10+1205, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*20+1365, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*10+1605, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*10+1805, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*10+1955, global.generate_timeline_id, 1, 1, 1);
			set_enemy_generate_timeline(i*10+2605, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*20+2755, global.generate_timeline_id, 1, 1, 1);
		}
		for(var i=0; i<5; i++){
			set_enemy_generate_timeline(i*30+360, global.generate_timeline_id, 0, 3, 0);
			set_enemy_generate_timeline(i*30+600, global.generate_timeline_id, 0, 3, 0);
			set_enemy_generate_timeline(i*20+35, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*20+175, global.generate_timeline_id, 1, 0, 1);
			set_enemy_generate_timeline(i*40+2000, global.generate_timeline_id, 0, 2, 0);
			set_enemy_generate_timeline(i*40+2300, global.generate_timeline_id, 0, 2, 0);
			set_enemy_generate_timeline(i*50+2550, global.generate_timeline_id, 0, 3, 0);
			set_enemy_generate_timeline(i*10+2800, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+2900, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+3000, global.generate_timeline_id, 0, 0, 0);
			set_enemy_generate_timeline(i*10+3100, global.generate_timeline_id, 0, 0, 0);
		}
		for(var i=0; i<3; i++){
			set_enemy_generate_timeline(i*20+1280, global.generate_timeline_id, 0, 3, 0);
			set_enemy_generate_timeline(i*20+1400, global.generate_timeline_id, 0, 3, 0);
		}
		for(var i=0; i<10; i++){
			set_enemy_generate_timeline(i*40+2105, global.generate_timeline_id, 1, 1, 1);
		}
	break
	}
break
#endregion
default:
	sdm("error! generate_setup_time");
break
}
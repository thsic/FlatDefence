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
	/*switch(global.wave_now){
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
	}*/
break
#endregion
#region stage2
case 2:
/*switch(global.wave_now){
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
break*/
#endregion
#region stage3
case 3:
	/*switch(global.wave_now){
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
	}*/
break
#endregion
#region stage4
case 4:
	switch(global.wave_now){
	case 1:
	
	break
	}
break
#endregion
default:
	sdm("error! generate_setup_time");
break
}
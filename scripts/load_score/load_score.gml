///
//stageid -1はテストステージなのでスコアが記録されない
global.totalscore = 0;


sdm("Save.iniをロード")
if(file_exists("Save.ini")){//セーブファイル存在チェック
	//var load_map = ds_map_secure_load("Save.ini");
	var load_map = ds_map_create();
	ini_open("Save.ini");
	var map_string = ini_read_string("StageScore", "Score", "");
	if map_string != ""{//mapが存在するならそれをロード
		ds_map_read(load_map, map_string);
	}
	ini_close();
	
	for(var i=1; i<STAGE_AMOUNT+1; i++){
		if(ds_map_exists(load_map, i)){//スコアが存在する
			global.stagescore[i] = ds_map_find_value(load_map, i);//mapからスコア情報を取得
			global.totalscore += global.stagescore[i];
		}
		else{//スコアが存在しない
			global.stagescore[i] = 0;
		}
	}
	ds_map_destroy(load_map);//不要になったので削除
}
else{//初回起動
	for(var i=1; i<STAGE_AMOUNT+1; i++){
		global.stagescore[i] = 0;
		global.totalscore += global.stagescore[i];
	}
}


//非暗号化のロード処理
/*sdm("Save.iniをロード")
var load_map = ds_map_secure_load("Save.ini");

ini_open("Save.ini");
for(var i=1; i<STAGE_AMOUNT+1; i++){
	global.stagescore[i] = ini_read_real("StageScore", string(i), 0);
	global.totalscore += global.stagescore[i];
}
ini_close();
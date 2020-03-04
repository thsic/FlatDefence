///@param stageid,score
var stage_id = argument0;
var stage_score = argument1;
var new_record = false;

if(file_exists("Save.ini")){//ファイルが存在する
	//var map = ds_map_secure_load("Save.ini");
	var map = ds_map_create();//空のmap生成
	ini_open("Save.ini");//iniファイル読み込む
	var map_string = ini_read_string("StageScore", "Score", "");
	if map_string != ""{
		ds_map_read(map, map_string);//mapが存在するなら読み込む
	}
	ini_close();
	
	if(ds_map_exists(map, stage_id)){//スコアの存在チェック
		var oldscore = ds_map_find_value(map, stage_id);
		if(oldscore < stage_score){//スコアを比較
			ds_map_replace(map, stage_id, stage_score);//現在の方が大きいのでreplace
			new_record = true;
		}
	}
	else{//スコアが存在しないのでそのまま現在のスコアが最高スコアになる
		ds_map_add(map, stage_id, stage_score);
		new_record = true;
	}
}
else{//ファイルが存在しない
	var map = ds_map_create();
	ds_map_add(map, stage_id, stage_score);
	new_record = true;
}

ini_open("Save.ini");
var map_string = ds_map_write(map);//変換
ini_write_string("StageScore", "Score", map_string);//セーブ
ini_close();
sdm("Save.iniにセーブ");
//ds_map_secure_save(map, "Save.ini");
ds_map_destroy(map);//不要になったので削除

return new_record


//非暗号化のセーブ処理
/*ini_open("Save.ini");
ini_write_string("XD", "Description", "ここの値を変更することでゲームのスコアを変更できます。 ゲームバランスが崩壊するので推奨はしません。");
var oldscore = ini_read_real("StageScore", string(stage_id), 0);
if(oldscore < stage_score){
	ini_write_real("StageScore", string(stage_id), stage_score);
	sdm("Save.iniにセーブ")
}
ini_close();
var map = ds_map_create();
ds_map_add(map, 129, "TropicalGrowth");
ds_map_secure_save(map, "Save.ini");
ds_map_destroy(map);


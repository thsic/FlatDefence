///@param stageid,score
var stage_id = argument0;
var stage_score = argument1;

sdm(stage_id)
ini_open("Save.ini");
var oldscore = ini_read_real("StageScore", string(stage_id), 0);
if(oldscore < stage_score){
	ini_write_real("StageScore", string(stage_id), stage_score);
	sdm("Save.iniにセーブ")
}
ini_close();


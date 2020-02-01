///
//stageid -1はテストステージなのでスコアが記録されない
global.totalscore = 0;

sdm("Save.iniをロード")

ini_open("Save.ini");
for(var i=0; i<STAGE_AMOUNT; i++){
	global.stagescore[i] = ini_read_real("StageScore", string(i), 0);
	global.totalscore += global.stagescore[i];
}
ini_close();

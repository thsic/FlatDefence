///@param gold
var gold = argument0;

global.gold -= gold;
if(sign(global.score_gold_minus)){
	global.score_gold_minus -= gold;//ゴールドを消費する時は売却時のスコアデバフも減る
}
if(sign(global.score_gold_minus) = -1){
	global.score_gold_minus = 0;
}

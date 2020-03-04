//ステージクリア時のスコアを計算する
stageclear_score = STAGECLEAR_SCORE;
life_score = LIFE_SCORE * global.life;
gold_score = GOLD_SCORE * (global.gold - global.score_gold_minus);//売却ゴールドはクリア時のスコアに加算されない
if(gold_score < 0){//ゴールドスコアがマイナスになる場合がある
	gold_score = 0;
}
total_score = stageclear_score + life_score + gold_score;

var new_record = save_score(global.stage, total_score);//スコアをiniファイルにセーブ 返り値はスコア更新したかどうか
return new_record
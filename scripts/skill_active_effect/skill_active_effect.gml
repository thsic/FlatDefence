///@param x,y,range,freq,probability
var effect_x = argument0;
var effect_y = argument1;
var effect_range = argument2;
var effect_freq = argument3;
var effect_prob = argument4;

if(skill_particle_time = 0){
	var particle_amount = 0
	repeat(8){
		if(irandom(100) < effect_prob){
			particle_amount++ //アイテムの所持数分乱数で判定
		}
	}
	repeat(particle_amount){//判定が成功した回数だけパーティクル描画
		//エフェクト発生
		var particle_x = effect_x+irandom_range(-effect_range, effect_range);
		var particle_y = effect_y+irandom_range(-effect_range, effect_range);
		var color = c_aqua;
		line_effect(particle_x, particle_y, 12, 90, 6, 6, color, 2, 0);
		skill_particle_time = effect_freq;
	}
}
else{
	skill_particle_time--;
}
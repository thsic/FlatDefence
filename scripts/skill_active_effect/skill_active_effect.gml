///@param x,y,range,freq,probability
var effect_x = argument0;
var effect_y = argument1+4;
var effect_range = 14;
var effect_freq = 5;
var effect_prob = 10;

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
		//色
		var color = COLOR_SKILL_ACTIVE_BASE;
		var hue = color_get_hue(color)+irandom_range(-20, 20);
		var saturation = color_get_saturation(color)+irandom_range(-20, 20)+100;
		var value = color_get_value(color)+irandom_range(-20, 20)+200;
		if(hue > 255){hue -= 255}
		color = make_color_hsv(hue, saturation, value)
		
		line_effect(particle_x, particle_y, 20, 90, 4, 10, color, 2, 0, 0.4);
		skill_particle_time = effect_freq;
	}
}
else{
	skill_particle_time--;
}
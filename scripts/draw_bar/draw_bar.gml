///@param "type",now,max,col,b_col
//drawイベント内におくこと
var bartype = argument0;
var now = argument1;
var maximum = argument2;
var bar_color = argument3;
var bar_backgloundcolor = argument4;
switch(bartype){
case "hp":
	var bar_percent = now / maximum
	var bar_width = 14;
	var bar_height = 1;
	//hpバーの位置指定
	var bar_x = x - bar_width / 2
	var bar_y = y + sprite_height/2 + 1;

	if(sign(bar_percent) = -1){bar_percent = 0}//hpがマイナスでも表示上は0
	draw_set_color(bar_backgloundcolor);
	draw_rectangle(bar_x, bar_y, bar_x+bar_width, bar_y+bar_height, false);//hpバーの後ろ側 maxhp
	draw_set_color(bar_color);
	draw_rectangle(bar_x, bar_y, bar_x+bar_width*bar_percent, bar_y+bar_height, false);//表のhpをあらわすほう
	draw_set_color(c_white);//色リセット
break
case "cooldown":
	var bar_percent = 1 - now / maximum //cooldownは0に近づくとゲージが増えるようにしたい
	var bar_width = 24;
	var bar_height = 2;
	var bar_x = x - bar_width / 2
	var bar_y = y + sprite_height/2 -2;

	if(sign(bar_percent) = -1){bar_percent = 0}
	draw_set_color(bar_backgloundcolor);
	draw_rectangle(bar_x, bar_y, bar_x+bar_width, bar_y+bar_height, false);
	draw_set_color(bar_color);
	draw_rectangle(bar_x, bar_y, bar_x+bar_width*bar_percent, bar_y+bar_height, false);
	draw_set_color(c_white);
break
case "skill":
	var bar_percent = 1 - now / maximum //cooldownは0に近づくとゲージが増えるようにしたい
	var bar_width = 24;
	var bar_height = 2;
	var bar_x = x - bar_width / 2
	var bar_y = y + sprite_height/2 + 8;

	if(sign(bar_percent) = -1){bar_percent = 0}
	draw_set_color(bar_backgloundcolor);
	draw_rectangle(bar_x, bar_y, bar_x+bar_width, bar_y+bar_height, false);
	draw_set_color(bar_color);//青
	draw_rectangle(bar_x, bar_y, bar_x+bar_width*bar_percent, bar_y+bar_height, false);
	draw_set_color(c_white);
break
case "skill_active":
	var bar_percent = now / maximum//終わりが近づくと減っていく
	var bar_width = 24;
	var bar_height = 2;
	var bar_x = x - bar_width / 2
	var bar_y = y + sprite_height/2 + 8;

	if(sign(bar_percent) = -1){bar_percent = 0}
	draw_set_color(bar_backgloundcolor);
	draw_rectangle(bar_x, bar_y, bar_x+bar_width, bar_y+bar_height, false);
	draw_set_color(bar_color);
	draw_rectangle(bar_x, bar_y, bar_x+bar_width*bar_percent, bar_y+bar_height, false);
	draw_set_color(c_white);
break
case other:
	sdm("error! draw_bar");
break

}
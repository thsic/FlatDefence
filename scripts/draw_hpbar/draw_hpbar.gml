///@param nowhp,maxhp
//drawイベント内におくこと
var nowhp = argument0;
var maxhp = argument1;
var hpbar_width = 48;
var hpbar_height = 2;
var hpbar_color = c_yellow;
var hpbar_backgloundcolor = c_gray;
var hp_percent = nowhp / maxhp
//hpバーの位置指定
var hpbar_x = x - hpbar_width / 2
var hpbar_y = y + sprite_height/2 + 4;

if(sign(hp_percent) = -1){hp_percent = 0}//hpがマイナスでも表示上は0
draw_set_color(hpbar_backgloundcolor);
draw_rectangle(hpbar_x, hpbar_y, hpbar_x+hpbar_width, hpbar_y+hpbar_height, false);//hpバーの後ろ側 maxhp
draw_set_color(hpbar_color);
draw_rectangle(hpbar_x, hpbar_y, hpbar_x+hpbar_width*hp_percent, hpbar_y+hpbar_height, false);//表のhpをあらわすほう
draw_set_color(c_white);//色リセット

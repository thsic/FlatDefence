///@param window_x, window_y, width, height
//defenderをクリックした時のウィンドウのテキストとか

var x_offset = argument0;
var y_offset = argument1;
var width = argument2;
var height = argument3;
draw_sprite(finded_defender_id.sprite_index, 0, x_offset+22, y_offset+24);//defenderの画像 32x32以外だと変になるかも middlecentreなのを忘れない
draw_text(x_offset+42, y_offset+6, finded_defender_id.defender_name);
draw_set_color(c_gray);
draw_text(x_offset+4, y_offset+38, "Damage");
draw_text(x_offset+4, y_offset+38+16*2+4, "AttackSpeed");
draw_text(x_offset+4, y_offset+38+16*4+8, "Range");
draw_set_color(c_dkgray);
draw_set_color(c_white);
draw_text(x_offset+4, y_offset+38+16*1, finded_defender_id.fire_damage);
draw_text(x_offset+4, y_offset+38+16*3+4, finded_defender_id.attack_per_second);
draw_text(x_offset+4, y_offset+38+16*5+8, finded_defender_id.range);
draw_set_color(c_white)
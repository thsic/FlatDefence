///@param window_x, window_y, width, height
//defenderをクリックした時のウィンドウのテキストとか

var x_offset = argument0;
var y_offset = argument1;
var width = argument2;
var height = argument3;
draw_sprite(finded_defender_id.sprite_index, 0, x_offset+22, y_offset+24);//defenderの画像 32x32以外だと変になるかも middlecentreなのを忘れない
draw_text(x_offset+42, y_offset+6, global.defender_data[defender_id_conversion(finded_defender_id), data.name]);
//アイテムスロット
var item_number = 0;
for(var i=0; i<finded_defender_id.itemslot_amount; i++){
	if(finded_defender_id.itemslot[i] != -1){
		item_number++
	}
}

#region アップグレード先変更ボタン
//defenderが持っているアイテムの数でuiが変わる
draw_set_halign(fa_middle)
switch(item_number){
case 1:
	var button_offset_x = x_offset+width/2;
	var button_offset_y = y_offset+100;
	draw_sprite_ext(s_upgradeButton, 0, button_offset_x, button_offset_y, 1, 1, 0, c_white, 0.7);
	draw_sprite(global.itemdata[finded_defender_id.itemslot[0], itemdata.sprite], 0, button_offset_x-58, button_offset_y);
	draw_text(button_offset_x+16, button_offset_y-12, global.itemdata[finded_defender_id.itemslot[0], itemdata.name]);
break
case 2:
	for(i=1; i<=2; i++){
		if(i=1){
			var button_offset_x = x_offset+width/7*2
		}
		else{
			var button_offset_x = x_offset+width/7*5
		}
		var button_offset_y = y_offset+100;
		draw_sprite_ext(s_upgradeButton, 0, button_offset_x, button_offset_y, 1, 1, 0, c_white, 0.7);
		draw_sprite(global.itemdata[finded_defender_id.itemslot[0], itemdata.sprite], 0, button_offset_x-58, button_offset_y);
		draw_text(button_offset_x+16, button_offset_y-12, global.itemdata[finded_defender_id.itemslot[0], itemdata.name]);
	}
break
case 3:
	for(i=1; i<=3; i++){
		var button_offset_x = x_offset+width/6*(i*2-1);
		var button_offset_y = y_offset+100;
		draw_sprite_ext(s_upgradeButton, 0, button_offset_x, button_offset_y, 1, 1, 0, c_white, 0.7);
		draw_sprite(global.itemdata[finded_defender_id.itemslot[0], itemdata.sprite], 0, button_offset_x-58, button_offset_y);
		draw_text(button_offset_x+16, button_offset_y-12, global.itemdata[finded_defender_id.itemslot[0], itemdata.name]);
	}
break
case 4://アイテム4つの時だけ2段になる
	for(i=1; i<=4; i++){
		switch(i){
		case 1:
			var button_offset_x = x_offset+width/7*2;
			var button_offset_y = y_offset+80;
		break
		case 2:
		case 4:
			var button_offset_x = x_offset+width/7*5;
		break
		case 3:
			var button_offset_x = x_offset+width/7*2;
			var button_offset_y = y_offset+132;
		break
		}
		draw_sprite_ext(s_upgradeButton, 0, button_offset_x, button_offset_y, 1, 1, 0, c_white, 0.7);
		draw_sprite(global.itemdata[finded_defender_id.itemslot[0], itemdata.sprite], 0, button_offset_x-58, button_offset_y);
		draw_text(button_offset_x+16, button_offset_y-12, global.itemdata[finded_defender_id.itemslot[0], itemdata.name]);
	}
break
}
#endregion

var upgrade_text_y = y_offset+180//このyの値を変えるといっぺんに変えれる

//アイテム説明テキスト
draw_set_color(COLOR_TEXT_ORANGE);//アップグレード前と文章が違ったら色を変える
draw_text(x_offset+width/5*1, upgrade_text_y+180, global.itemdata[1, itemdata.description]);
if(global.itemdata[1, itemdata.description] != global.itemdata[1+1, itemdata.description]){
	draw_set_color(COLOR_TEXT_GREEN);
}
else{
	draw_set_color(COLOR_TEXT_WHITE);
}
draw_text(x_offset+width/5*4, upgrade_text_y+180, global.itemdata[1+1, itemdata.description]);

//アップグレードボタン
draw_set_color(COLOR_TEXT_WHITE);
draw_sprite(s_upgradeButton, 0, x_offset+width/2, y_offset+height-50);
draw_text(x_offset+width/2, y_offset+height-62, "Upgrade")

//比較用数値
draw_set_halign(fa_left)
draw_set_color(COLOR_TEXT_GRAY);
draw_text(x_offset+80, upgrade_text_y, "Damage");
draw_text(x_offset+80, upgrade_text_y+60, "AttackSpeed");
draw_text(x_offset+80, upgrade_text_y+120, "Range");
draw_text(x_offset+400, upgrade_text_y, "Damage");
draw_text(x_offset+400, upgrade_text_y+60, "AttackSpeed");
draw_text(x_offset+400, upgrade_text_y+120, "Range");

draw_set_color(COLOR_TEXT_WHITE);
draw_sprite(s_rightArrow, 0, x_offset+width/2, upgrade_text_y+26);
draw_sprite(s_rightArrow, 0, x_offset+width/2, upgrade_text_y+86);
draw_sprite(s_rightArrow, 0, x_offset+width/2, upgrade_text_y+146);
draw_text(x_offset+width/2, y_offset+38, "Choose Upgrade!");
draw_text(x_offset+80, upgrade_text_y+20, global.itemdata[1, itemdata.damage]);
draw_text(x_offset+80, upgrade_text_y+80, global.itemdata[1, itemdata.attack_speed]);
draw_text(x_offset+80, upgrade_text_y+140, global.itemdata[1, itemdata.range]);
//アップグレードで強化されていたら色を変える
if(global.itemdata[1, itemdata.damage] < global.itemdata[1+1, itemdata.damage]){
	draw_set_color(COLOR_TEXT_GREEN);
}
else{
	draw_set_color(COLOR_TEXT_WHITE);
}
draw_text(x_offset+400, upgrade_text_y+20, global.itemdata[1+1, itemdata.damage]);
if(global.itemdata[1, itemdata.attack_speed] < global.itemdata[1+1, itemdata.attack_speed]){
	draw_set_color(COLOR_TEXT_GREEN);
}
else{
	draw_set_color(COLOR_TEXT_WHITE);
}
draw_text(x_offset+400, upgrade_text_y+80, global.itemdata[1+1, itemdata.attack_speed]);
if(global.itemdata[1, itemdata.range] < global.itemdata[1+1, itemdata.range]){
	draw_set_color(COLOR_TEXT_GREEN);
}
else{
	draw_set_color(COLOR_TEXT_WHITE);
}
draw_text(x_offset+400, upgrade_text_y+140, global.itemdata[1+1, itemdata.range]);



draw_set_color(COLOR_DEFAULT);


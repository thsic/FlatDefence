///@param window_x, window_y, width, height
//defenderをクリックした時のウィンドウのテキストとか

var x_offset = argument0;
var y_offset = argument1;
var width = argument2;
var height = argument3;
draw_sprite(finded_defender_id.sprite_index, 0, x_offset+22, y_offset+24);//defenderの画像 32x32以外だと変になるかも middlecentreなのを忘れない
draw_set_color(COLOR_TEXT_ORANGE);
draw_text(x_offset+42, y_offset+22, global.defender_data[defender_id_conversion(finded_defender_id.object_index), data.description])
draw_set_color(COLOR_TEXT_GRAY);
draw_text(x_offset+4, y_offset+38, "Damage");
draw_text(x_offset+4, y_offset+38+16*2+4, "AttackSpeed");
draw_text(x_offset+4, y_offset+38+16*4+8, "Range");
draw_set_color(COLOR_TEXT_WHITE);
draw_text(x_offset+42, y_offset+6, global.defender_data[defender_id_conversion(finded_defender_id.object_index), data.name]);
draw_text(x_offset+4, y_offset+38+16*1, finded_defender_id.fire_damage);
draw_text(x_offset+4, y_offset+38+16*3+4, finded_defender_id.attack_per_second);
draw_text(x_offset+4, y_offset+38+16*5+8, finded_defender_id.range);

//defenderについているeffect一覧 いっぱいループがあるから大変だった
var effect_order = 0;//effectのidが入る
var effect_level = 0;//effectのlvが入る
for(var i=0; i<EFFECT_SLOT_MAX; i++){
	effect_order[i] = -1;
	effect_level[i] = 1;
}
for(var i=0; i<EFFECT_SLOT_MAX; i++){
	var effect_id_temp = finded_defender_id.effect_now[i, effectnow.number];//入れたいeffectid
	if(effect_id_temp != -1){
		var effect_overlap = -1;
		for(var j=0; j<EFFECT_SLOT_MAX; j++){
			if(effect_order[j] = effect_id_temp){
				var effect_overlap = j//エフェクトがかぶっていた場合そのidをeffect_overlapにいれる
				break
			}
		}
		if(effect_overlap = -1){//エフェクトにかぶりがなかった場合
			for(var k=0; k<EFFECT_SLOT_MAX; k++){
				if(effect_order[k] = -1){
					effect_order[k] = effect_id_temp;//空いている所みつけて入れる
					break
				}
			}
		}
		else{//エフェクトにかぶりがあった場合
			effect_level[effect_overlap]++;//かぶったのでレベル上昇
		}
	}
	else{
		break//一度-1がでたらその先は無いので
	}
}
draw_set_color(COLOR_TEXT_ORANGE);
for(var i=0; i<EFFECT_SLOT_MAX; i++){
	if(effect_order[i]) != -1{
		//描画
		draw_set_color(global.effectdata[effect_order[i], effectdata.color]);
		if(global.effectdata[effect_order[i], effectdata.overlap] = true){//効果の重複が可能か
			draw_text(x_offset+150, y_offset+38+16*i, global.effectdata[effect_order[i], effectdata.name]+" LV"+string(effect_level[i]))
		}
		else{
			draw_text(x_offset+150, y_offset+38+16*i, global.effectdata[effect_order[i], effectdata.name])
		}
		
	}
}
draw_set_color(COLOR_TEXT_WHITE);
surface_free(global.usefulwindow_surface[6]);
//エフェクトにマウスカーソルを合わせると説明が表示される
for(var i=0; i<EFFECT_SLOT_MAX; i++){
	if(effect_order[i]) != -1{
		if(x_offset+150 < mouse_x and mouse_x < x_offset+width){
			if(y_offset+38+16*i < mouse_y and mouse_y < y_offset+38+16+i*16){
				var description = global.effectdata[effect_order[i], effectdata.description]
				tiny_window(s_window, 6, mouse_x+12, mouse_y, string_width(description)+24, 28, 1);
				draw_text(mouse_x+16, mouse_y+4, description);
				break
			}
		}
	}
}


draw_set_color(COLOR_DEFAULT);
//アイテムスロット
for(var i=0; i<finded_defender_id.itemslot_amount; i++){
	if(finded_defender_id.itemslot[i] = -1){
		draw_sprite(s_itemSlot, 0, x_offset+22+i*36, y_offset+172);
	}
	else{
		draw_sprite(global.itemdata[finded_defender_id.itemslot[i], itemdata.sprite], 0, x_offset+22+i*36, y_offset+172);
		
	}
}
surface_free(global.usefulwindow_surface[7]);
for(var i=0; i<finded_defender_id.itemslot_amount; i++){
	if(finded_defender_id.itemslot[i] != -1){
		if(x_offset+22+i*36-16 < mouse_x and mouse_x < x_offset+22+i*36+SPRITE_SIZE*2-16){
			if(y_offset+172-16 < mouse_y and mouse_y < y_offset+172+SPRITE_SIZE*2-16){
				//マウスカーソルをかざすとアイテムのデータ表示
				shop_description(3, finded_defender_id.itemslot[i], false)
			}
		}
	}
}

///@param defenderid,color
//アイテム装備エフェクトの流用
var defender_id = argument0;
var color = COLOR_UPGRADE_EFFECT;

var effect_x = defender_id.x;
var effect_y = defender_id.y;

//アップグレード済みアイテム探し
var upgraded_item = 0;
for(var i=0; i<defender_id.itemslot_amount; i++){
	if(defender_id.itemslot[i] != -1){
		if(global.itemdata[defender_id.itemslot[i], itemdata.upgraded] = true){
			upgraded_item++;
		}
	}
	else{
		break;//forからぬける
	}
}

blast_circle(effect_x, effect_y, 0, 0, 56, color, 26, 12, 1, upgraded_item+3);

var line_amount = 8;
var line_addangle = 360/line_amount;
var angle_default = 90;




for(var i=0; i<line_amount; i++){
	var angle = line_addangle*-i+angle_default;
	var line_x = lengthdir_x(56, angle)+effect_x;
	var line_y = lengthdir_y(56, angle)+effect_y;
	
	line_effect(line_x, line_y, 16, angle, 8, 10, color, 2, 16, 0);
	
	var square_x = lengthdir_x(56+28, angle)+effect_x;
	var square_y = lengthdir_y(56+28, angle)+effect_y;
	
	with(instance_create_layer(square_x, square_y, "UI", o_effect)){//四角を生成
		type = 9;
		effect_delay = 16+8;
		effect_color = color;
		direction = angle;
	}
}







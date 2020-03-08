///@param red,green,blue,objectID,quantity
//LVを考慮して色の変更をおこなう

var red = argument0;
var green = argument1;
var blue = argument2;
var object_id = argument3;
var quantity = argument4;

//オブジェクトネームからレベル取得
var objectname = object_get_name(object_id);
var object_name_length = string_length(objectname);
var enemy_level = string_char_at(objectname, object_name_length);

//敵のレベルによって色調整
switch(enemy_level){
	case 1:
		red += quantity;
		green += quantity;
		blue += quantity;
	break
	case 2:
		
	break
	case 3:
		red -= quantity;
		green -= quantity;
		blue -= quantity;
	break
}

var color = make_color_rgb(red, green, blue);

return color

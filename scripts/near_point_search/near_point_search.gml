///@param searchtype,len,x1,y1,obj/x2,y2
//type object 0/array 1/shop 2/
var searchtype = argument0;
var length = argument1;
var x1 = argument2;
var y1 = argument3;
if(searchtype = 0){
	var object = argument4;
}
else{
	var x2 = argument4;
	var y2 = argument5;
	if(searchtype = 1){
		if(is_array(x2) and is_array(y2)){
			var search_number_max = array_length_1d(x2)
		}
		else{
			sdm("error! near_point_search")
		return -1
		}
	}

}

var distance = 10000;
var nearest_distance = 10000;
switch(searchtype){
case 0://object
	for(var i=0; i<instance_number(object); i++){//一番近いやつを見つける
		var object_id = instance_find(object, i);
		distance = point_distance(x1, x2, object_id.x, object_id.y);
		if(distance < nearest_distance){
			var nearest_object = object_id;
			var nearest_distance = distance;
		}
	}
break
case 1://array
	for(var i=0; i<search_number_max; i++){
		distance = point_distance(x1, y1, x2[i], y2[i])
		if(distance < nearest_distance){
			var nearest_number = i;
			var nearest_distance = distance;
		}
	}
break
case 2://shop
	var search_number_max = array_height_2d(shop_product)
	for(var i=0; i<search_number_max; i++){
		distance = point_distance(x1, y1, shop_product[i, SPRITE_X], shop_product[i, SPRITE_Y])
		if(distance < nearest_distance){
			var nearest_number = i;
			var nearest_distance = distance;
		}
	}
	search_number_max = array_height_2d(shop_item_product);
	for(i=0; i<search_number_max; i++){
		distance = point_distance(x1, y1, shop_item_product[i, SPRITE_X], shop_item_product[i, SPRITE_Y])
		if(distance < nearest_distance){
			var nearest_number = i + 10000;//アイテムは10000~
			var nearest_distance = distance;
		}
	}
	search_number_max = array_height_2d(global.item_possession);
	for(i=0; i<POSSESSION_ITEM_MAX; i++){
		if(item_possession_data[i, ITEM] != -1){
			distance = point_distance(x1, y1, item_possession_data[i, SPRITE_X], item_possession_data[i, SPRITE_Y])
			if(distance < nearest_distance){
				var nearest_number = i + 20000;//所持アイテムは20000~
				var nearest_distance = distance;
			}
		}
	}
break

}

if(length >= nearest_distance){
	if(searchtype = 0){
		return nearest_object
	}
	else{
		return nearest_number
	}
}
else{
	return -1
}



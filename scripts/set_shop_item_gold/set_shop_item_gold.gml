///@param shopItemID,operator,value
var shop_item_id = argument0;
var operator = argument1;
var value = argument2;

if(room != r_stageSelect){
	var item_id = global.shop_item[shop_item_id];

	switch(operator){
	case "=":	
		shop_item_product[shop_item_id, COST] = value;
	break
	case "+":
		shop_item_product[shop_item_id, COST] = global.itemdata[item_id, itemdata.cost]+value;
	break
	case "-":
		shop_item_product[shop_item_id, COST] = global.itemdata[item_id, itemdata.cost]-value;
	break
	case "*":
		shop_item_product[shop_item_id, COST] = global.itemdata[item_id, itemdata.cost]*value;
	break
	case "/":
		shop_item_product[shop_item_id, COST] = global.itemdata[item_id, itemdata.cost]/value;
	break
	default:
		shop_item_product[shop_item_id, COST] = global.itemdata[item_id, itemdata.cost];
		sdm("error! set_shop_item_gold")
	break
	}
}


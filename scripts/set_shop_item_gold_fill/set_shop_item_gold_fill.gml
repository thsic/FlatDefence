
var shop_item_amount = array_length_1d(global.shop_item);
if(room != r_stageSelect){
	for(var i=0; i<shop_item_amount; i++){
		var item_id = global.shop_item[i];
		shop_item_product[i, COST] = global.itemdata[item_id, itemdata.cost];
	}
}
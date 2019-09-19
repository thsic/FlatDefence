//defenderを並べる
product_defender_amount = global.shop_defender_amount;//defenderの数
for(var i=0; i<product_defender_amount; i++){
	shop_product[i, DEFENDER] = global.shop_defender[i];
	shop_product[i, SPRITE_X] = window_get_width()-220+i*38;
	shop_product[i, SPRITE_Y] = 90;//y
}

product_item_amount = global.shop_item_amount;//itemの数
for(i=0; i<product_item_amount; i++){
	shop_item_product[i, ITEM] = global.itemdata[global.shop_item[i], itemdata.number];
	shop_item_product[i, SPRITE_X] = window_get_width()-220+i*38;
	shop_item_product[i, SPRITE_Y] = 300;
	shop_item_product[i, SPRITE] = global.itemdata[global.shop_item[i], itemdata.sprite];
}
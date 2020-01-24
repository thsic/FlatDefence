//defenderを並べる
product_defender_amount = global.shop_defender_amount;//defenderの数
for(var i=0; i<product_defender_amount; i++){
	shop_product[i, DEFENDER] = global.shop_defender[i];
	shop_product[i, SPRITE_X] = window_get_width()-224+i*38;
	shop_product[i, SPRITE_Y] = 132;//y
	shop_product[i, SALES] = 0//販売数
}

product_item_amount = global.shop_item_amount;//itemの数
for(i=0; i<product_item_amount; i++){
	
	shop_item_product[i, ITEM] = global.itemdata[global.shop_item[i], itemdata.number];
	shop_item_product[i, SPRITE] = global.itemdata[global.shop_item[i], itemdata.sprite];
	shop_item_product[i, SALES] = 0;
	if(i<6){
		shop_item_product[i, SPRITE_X] = window_get_width()-224+i*38;
		shop_item_product[i, SPRITE_Y] = 250;
	}
	else if(i<12){
		shop_item_product[i, SPRITE_X] = window_get_width()-224+(i-6)*38;
		shop_item_product[i, SPRITE_Y] = 300;
	}
	else{
		shop_item_product[i, SPRITE_X] = window_get_width()-224+(i-12)*38;
		shop_item_product[i, SPRITE_Y] = 350;
	}
}


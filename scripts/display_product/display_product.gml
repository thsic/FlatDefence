//defenderを並べる
product_defender_amount = 2;//defenderの数
shop_product[0, DEFENDER] = o_dBasic;
shop_product[0, SPRITE_X] = window_get_width()-220;
shop_product[0, SPRITE_Y] = 90;//y

shop_product[1, DEFENDER] = o_dSniper;
shop_product[1, SPRITE_X] = window_get_width()-220+38;
shop_product[1, SPRITE_Y] = 90;


product_item_amount = 2;//itemの数
shop_item_product[0, ITEM] = global.itemdata[0, itemdata.number];
shop_item_product[0, SPRITE_X] = window_get_width()-220;
shop_item_product[0, SPRITE_Y] = 300;
shop_item_product[0, SPRITE] = global.itemdata[0, itemdata.sprite];

shop_item_product[1, ITEM] = global.itemdata[1, itemdata.number];
shop_item_product[1, SPRITE_X] = window_get_width()-220+38;
shop_item_product[1, SPRITE_Y] = 300;
shop_item_product[1, SPRITE] = global.itemdata[1, itemdata.sprite];
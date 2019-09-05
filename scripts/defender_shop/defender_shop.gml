//ショップ
if(shop_product = noone){//初期状態なら商品の設定をする
	grab_defender_id = -1;//商品を掴んでいるかどうか 掴んでいるならそのid
	display_product();
	
	
	
}
if(mouse_check_button_pressed(mb_left)){//マウス押された
	for(i=0; i < product_defender_amount; i++){//商品がクリックされたかどうかの確認
		if(shop_product[i, SPRITE_X]-16 <= mouse_x and mouse_x <= shop_product[i, SPRITE_X]+16){
			if(shop_product[i, SPRITE_Y]-16 <= mouse_y and mouse_y <= shop_product[i, SPRITE_Y]+16){
				//商品を掴んだ
				sdm(global.defender_data[i, data.cost])
				global.gold -= global.defender_data[i, data.cost];//お金をへらす
				grab_defender_id = shop_product[i, DEFENDER];
				break;
			}
		}
	}
}
//商品を掴んでいる
if(grab_defender_id != -1){
	if(!mouse_check_button(mb_left)){//離した
		instance_create_layer(mouse_x, mouse_y, "Defenders", grab_defender_id);
		grab_defender_id = -1;
	}
}
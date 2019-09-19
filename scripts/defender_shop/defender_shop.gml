//ショップ
if(shop_product = noone){//初期状態なら商品の設定をする
	grab_defender_id = -1;//商品を掴んでいるかどうか 掴んでいるならそのid
	grab_item_id = -1;//アイテム
	display_product();
	shop_window_width = 256;//shopの横幅
}
if(mouse_check_button_pressed(mb_left)){//マウス押された
	//defenderの場合
	for(i=0; i < product_defender_amount; i++){//商品がクリックされたかどうかの確認
		if(shop_product[i, SPRITE_X]-16 <= mouse_x and mouse_x <= shop_product[i, SPRITE_X]+16){
			if(shop_product[i, SPRITE_Y]-16 <= mouse_y and mouse_y <= shop_product[i, SPRITE_Y]+16){
				//商品をクリックした
				if(global.gold >= global.defender_data[i, data.cost]){//残金チェック
					global.gold -= global.defender_data[i, data.cost];//お金をへらす
					grab_defender_id = shop_product[i, DEFENDER];
					window_mouse_set(shop_product[i, SPRITE_X], shop_product[i, SPRITE_Y]);//マウス座標を強制的にアイテムの中心へ
					rise_number(global.defender_data[i, data.cost], mouse_x, mouse_y, 3, 20, c_yellow, 1, true);
					break;
				}
				else{
					//買えなかった場合 音とかならすといいと思う
				}
			}
		}
	}
	//アイテムの場合
	for(i=0; i < product_item_amount; i++){//商品がクリックされたかどうかの確認
		if(shop_item_product[i, SPRITE_X]-16 <= mouse_x and mouse_x <= shop_item_product[i, SPRITE_X]+16){
			if(shop_item_product[i, SPRITE_Y]-16 <= mouse_y and mouse_y <= shop_item_product[i, SPRITE_Y]+16){
				//商品をクリックした
				if(global.gold >= global.itemdata[i, itemdata.cost]){//残金チェック
					global.gold -= global.itemdata[i, itemdata.cost];//お金をへらす
					grab_item_id = shop_item_product[i, ITEM];
					rise_number(global.itemdata[i, itemdata.cost], mouse_x, mouse_y, 3, 20, c_yellow, 1, true);
					break;
				}
				else{
					//買えなかった場合 音とかならすといいと思う
				}
			}
		}
	}
}
//商品を掴んでいる
if(grab_defender_id != -1){
	if(!mouse_check_button(mb_left)){//離した
		if(mouse_x < window_get_width()-shop_window_width){
			
			var distance = 10000;
			var nearest_distance = 10000;
			var markerid = instance_find(o_defenderMarker, 0);
			for(var i=0; i<instance_number(o_defenderMarker); i++){//マーカーと重なっているか確認
				var markerid = instance_find(o_defenderMarker, i);
				if(!markerid.on_defender){//上にdefenderが乗っているので置けない
					distance = point_distance(mouse_x, mouse_y, markerid.x, markerid.y)
				
					if(i=0 or nearest_distance >= distance){//一番近いマーカーを見つける
						var nearest_marker = markerid;
						var nearest_distance = distance;
					}
				}
			}
			drop_result = false;
			if(nearest_distance <= 32){//一番近いマーカーが一定距離以内だったら設置
				sdm(nearest_marker)
				instance_create_layer(nearest_marker.x, nearest_marker.y, "Defenders", grab_defender_id);
				nearest_marker.on_defender = true;
				var drop_result = true;
			}
			if(!drop_result){global.gold += global.defender_data[defender_id_conversion(grab_defender_id), data.cost];}//返金
			grab_defender_id = -1;
		}
		else{
			//shop画面の所でdefenderを離すと 払ったcostが戻ってくる
			global.gold += global.defender_data[defender_id_conversion(grab_defender_id), data.cost];
			grab_defender_id = -1;
		}
	}
}

if(grab_item_id != -1){
	if(!mouse_check_button(mb_left)){//離した
		purchase_item = false;
		if(mouse_x < window_get_width()-shop_window_width){
			for(i=0; i<instance_number(o_defender); i++){//アイテムを離した所がdefenderと重なっているか確認
				var target = instance_find(o_defender, i)
				if(target.x - SPRITE_SIZE/2 < mouse_x and mouse_x < target.x + SPRITE_SIZE/2){
					if(target.y - SPRITE_SIZE/2 < mouse_y and mouse_y < target.y + SPRITE_SIZE/2){
						//重なっている
						var purchase_item = equip_item(grab_item_id, target);//装備できなかったらfalseになる
						break
					}
				}
			}
			if(!purchase_item){global.gold += global.itemdata[grab_item_id, itemdata.cost];}
			grab_item_id = -1;
		}
		else{
			global.gold += global.itemdata[grab_item_id, itemdata.cost];
			grab_item_id = -1;
		}
	}
}
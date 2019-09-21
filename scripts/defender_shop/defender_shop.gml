//ショップ 所持アイテムの管理もしてる
if(shop_product = noone){//初期状態なら商品の設定をする
	grab_defender_id = -1;//商品を掴んでいるかどうか 掴んでいるならそのid
	grab_item_id = -1;//アイテム
	display_product();
}
#region 所持アイテム情報
for(i=0; i<POSSESSION_ITEM_MAX; i++){
	if(global.item_possession[i] != -1){
		item_possession_data[i, ITEM] = global.itemdata[global.item_possession[i], itemdata.number];
		item_possession_data[i, SPRITE] = global.itemdata[global.item_possession[i], itemdata.sprite];
	}
	else{
		item_possession_data[i, ITEM] = -1;
		item_possession_data[i, SPRITE] = -1;
	}
	if(i < 6){//2段にするための処理
		item_possession_data[i, SPRITE_X] = window_get_width()-224+i*38;
		item_possession_data[i, SPRITE_Y] = 450;
	}
	else{
		item_possession_data[i, SPRITE_X] = window_get_width()-224+(i-6)*38;
		item_possession_data[i, SPRITE_Y] = 490;
	}
}
#endregion
if(mouse_check_button_pressed(mb_left)){//マウス押された
	var grab_number = near_point_search(2, 32, mouse_x, mouse_y, 0, 0,)
	if(grab_number != -1){//なにか掴んでいる
		if(grab_number < 10000){
			//defenderを掴んだ
			var grab_product_number = grab_number;//掴んだ商品のshopでの番号をいれておく
			grab_number = defender_id_conversion(shop_product[grab_number, DEFENDER])//grab_numberの値をglobal.defender_dataで参照できる値に変換
			if(global.gold >= global.defender_data[grab_number, data.cost]){//残金チェック
				global.gold -= global.defender_data[grab_number, data.cost];//お金をへらす
				grab_defender_id = shop_product[grab_number, DEFENDER];
				window_mouse_set(shop_product[grab_product_number, SPRITE_X], shop_product[grab_product_number, SPRITE_Y]);//マウス座標を強制的にアイテムの中心へ
				rise_number(global.defender_data[grab_number, data.cost], mouse_x, mouse_y, 3, 20, c_yellow, 1, true);
			}
			else{
				//買えなかった場合 音とかならすといいと思う
			}
		}
		else if(grab_number < 20000){
			//アイテムを掴んだ
			grab_number -= 10000;//アイテムは10000~なのでその分を下げる
			var grab_product_number = grab_number;
			grab_number = shop_item_product[grab_number, ITEM]
			if(global.gold >= global.itemdata[grab_number, itemdata.cost]){//残金チェック
				global.gold -= global.itemdata[grab_number, itemdata.cost];//お金をへらす
				grab_item_id = shop_item_product[grab_number, ITEM];
				grab_item_possession_id = -1;
				window_mouse_set(shop_item_product[grab_product_number, SPRITE_X], shop_item_product[grab_product_number, SPRITE_Y]);
				rise_number(global.itemdata[grab_number, itemdata.cost], mouse_x, mouse_y, 3, 20, c_yellow, 1, true);
			}
			else{
				//買えなかった場合 音とかならすといいと思う
			}
		}
		else{
			//所持アイテムを掴んだ
			grab_number -= 20000;
			grab_item_id = item_possession_data[grab_number, ITEM];
			
			global.item_possession[grab_number] = -1;//所持アイテムを掴んだので一覧から消す
			item_possession_data[grab_number, ITEM] = -1;//同じく
			grab_item_possession_id = grab_number;//所持アイテムのマス目？番号
		}
	}
}
//商品を掴んでいる
if(grab_defender_id != -1){
	if(!mouse_check_button(mb_left)){//離した
		if(mouse_x < window_get_width()-SHOP_WINDOW_WIDTH){
			
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
				sdm(string(object_get_name(grab_defender_id))+ "を設置")
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
		if(mouse_x < window_get_width()-SHOP_WINDOW_WIDTH){
			var distance = 10000;
			var nearest_distance = 10000;
			for(var i=0; i<instance_number(o_defender); i++){//マーカーと重なっているか確認
				var defender_id = instance_find(o_defender, i);
				for(var j=0; j<defender_id.itemslot_amount; j++){//アイテムスロットに空きがあるか確認
					if(defender_id.itemslot[j] = -1){
					distance = point_distance(mouse_x, mouse_y, defender_id.x, defender_id.y)
						if(i=0 or nearest_distance >= distance){
							var nearest_defender = defender_id;
							var nearest_distance = distance;
						}
					}
				}
			}
			drop_result = false;//初期設定
			if(nearest_distance <= 32){
				//sdm(string(global.itemdata[grab_item_id, itemdata.name])+ "を装備")
				var purchase_item = equip_item(grab_item_id, nearest_defender);
				var drop_result = true;
			}
			if(grab_item_possession_id = -1){
				if(!purchase_item){global.gold += global.itemdata[grab_item_id, itemdata.cost];}//返金
			}
			else{
				if(!purchase_item){global.item_possession[grab_item_possession_id] = grab_item_id}
			}
			grab_item_id = -1;
		}
		else{
			if(grab_item_possession_id = -1){
				global.gold += global.itemdata[grab_item_id, itemdata.cost];//返金
			}
			else{
				global.item_possession[grab_item_possession_id] = grab_item_id
			}
			grab_item_id = -1;
		}
	}
}
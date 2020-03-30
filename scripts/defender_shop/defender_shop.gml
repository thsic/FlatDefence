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
			
			var reduce_gold = global.defender_data[grab_number, data.cost];
			for(var i=0; i<shop_product[grab_product_number, SALES]; i++){//販売数によって減らすお金が増える
				reduce_gold *= PRICE_INCREASE_DEFENDER;
			}
			if(global.gold >= reduce_gold){//残金チェック
				consumed_gold(floor(reduce_gold));//お金をへらす
				shop_product[grab_product_number, SALES] += 1;//販売数増やす
				
				play_se(SE_SHOP_BOUGHT, 60, 0.22, false);
				audio_sound_pitch(SE_SHOP_BOUGHT, 0.8);
				grab_defender_id = shop_product[grab_product_number, DEFENDER];
				grab_defender_shop_id = grab_product_number
				window_mouse_set(shop_product[grab_product_number, SPRITE_X], shop_product[grab_product_number, SPRITE_Y]);//マウス座標を強制的にアイテムの中心へ
				rise_number(floor(reduce_gold), mouse_x, mouse_y, 2, 30, c_yellow, 1, true, FONT_DEFAULT);
			}
			else{
				//買えなかった場合 音とかならすといいと思う
			}
		}
		else if(grab_number < 20000){
			//アイテムを掴んだ
			grab_number -= 10000;//アイテムは10000~なのでその分を下げる
			surface_free(global.usefulwindow_surface[9]);//アイテム装備ウィンドウサーフェスfree
			var grab_product_number = grab_number; //ここからgrab_numberはItemidになる
			grab_number = shop_item_product[grab_number, ITEM];
			
			var reduce_gold = shop_item_product[grab_product_number, COST];
			for(var i=0; i<shop_item_product[grab_product_number, SALES]; i++){//販売数によって減らすお金が増える
				reduce_gold *= PRICE_INCREASE;
			}
			if(global.gold >= reduce_gold){//残金チェック
				consumed_gold(floor(reduce_gold));//お金をへらす
				shop_item_product[grab_product_number, SALES] += 1;//販売数増やす
				
				play_se(SE_SHOP_BOUGHT, 60, 0.22, false);
				audio_sound_pitch(SE_SHOP_BOUGHT, 1);
				grab_item_id = shop_item_product[grab_product_number, ITEM];
				grab_item_shop_id = grab_product_number;
				grab_item_possession_id = -1;
				window_mouse_set(shop_item_product[grab_product_number, SPRITE_X], shop_item_product[grab_product_number, SPRITE_Y]);
				rise_number(floor(reduce_gold), mouse_x, mouse_y, 2, 30, c_yellow, 1, true, FONT_DEFAULT);
			}
			else{
				//買えなかった場合 音とかならすといいと思う
			}
		}
		else{
			//所持アイテムを掴んだ
			grab_number -= 20000;
			surface_free(global.usefulwindow_surface[9]);//アイテム装備ウィンドウサーフェスfree
			grab_item_id = item_possession_data[grab_number, ITEM];
			
			global.item_possession[grab_number] = -1;//所持アイテムを掴んだので一覧から消す
			item_possession_data[grab_number, ITEM] = -1;//同じく
			grab_item_possession_id = grab_number;//所持アイテムのマス目？番号
			play_se(SE_INVENTORY_GRAB, 40, 0.16, false);
		}
	}
}
//商品を掴んでいる
if(grab_defender_id != -1){
	var distance = 10000;
	var nearest_distance = 10000;
	var markerid = instance_find(o_defenderMarker, 0);
	for(var i=0; i<instance_number(o_defenderMarker); i++){
		//マーカーと重なっているか確認
		var markerid = instance_find(o_defenderMarker, i);
		if(!markerid.on_defender){//上にdefenderが乗っているので置けない
			distance = point_distance(mouse_x, mouse_y, markerid.x+SPRITE_SIZE, markerid.y+SPRITE_SIZE)
				
			if(i=0 or nearest_distance >= distance){//一番近いマーカーを見つける
				var nearest_marker = markerid;
				var nearest_distance = distance;
			}
		}
	}
	
	if(nearest_distance <= 24){
		nearest_marker.subimage = 1;//一番近いマーカーの色を変える
	}
	drop_result = false;
	if(!mouse_check_button(mb_left)){//離した
		if(mouse_x < window_get_width()-SHOP_WINDOW_WIDTH){
			if(nearest_distance <= 24){//一番近いマーカーが一定距離以内だったら設置
				sdm(string(object_get_name(grab_defender_id))+ "を設置")
				play_se(SE_DROP_DEFENDER, 55, 0.3, true);
				audio_sound_pitch(SE_DROP_DEFENDER, 1);
				var create_defender = instance_create_layer(nearest_marker.x+SPRITE_SIZE, nearest_marker.y+SPRITE_SIZE, "Defenders", grab_defender_id);
				if(global.gamestate = gamestate.rest or global.gamestate = gamestate.restpause){
					create_defender.cooldown = 0;//休憩中なら設置したdefenderのクールダウンを即解消
					create_defender.state = state.idle;
				}
				create_defender.marker_id = nearest_marker;//マーカーとdefenderを紐付け
				//販売数増やす
				//shop_product[grab_defender_shop_id, SALES] += 1;
				var drop_result = true;
				
				drop_defender_effect(create_defender.x, create_defender.y, grab_defender_id)//配置エフェクト
				nearest_marker.on_defender = true;
				grab_defender_id = -1;
			}
			else{
				if(!drop_result){
					shop_product[grab_defender_shop_id, SALES] -= 1;//販売数戻す
					var return_gold = global.defender_data[defender_id_conversion(grab_defender_id), data.cost]
					for(var i=0; i<shop_product[grab_defender_shop_id, SALES]; i++){
						return_gold *= PRICE_INCREASE_DEFENDER;
					}
					global.gold += floor(return_gold);
				}//返金
				
				grab_defender_id = -1;
				play_se(SE_SHOP_BOUGHT_CANCEL, 40, 0.17, false);
			}
		}
		else{
			shop_product[grab_defender_shop_id, SALES] -= 1;//販売数戻す
			//shop画面の所でdefenderを離すと 払ったcostが戻ってくる
			var return_gold = global.defender_data[defender_id_conversion(grab_defender_id), data.cost]
			for(var i=0; i<shop_product[grab_defender_shop_id, SALES]; i++){
				return_gold *= PRICE_INCREASE_DEFENDER;
			}
			global.gold += floor(return_gold);
			
			grab_defender_id = -1;
			play_se(SE_SHOP_BOUGHT_CANCEL, 40, 0.17, false);
			
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
				if(global.itemdata[grab_item_id, itemdata.upgraded] != -1){//アップグレードオーブ以外なら
					for(var j=0; j<defender_id.itemslot_amount; j++){//アイテムスロットに空きがあるか確認
						if(defender_id.itemslot[j] = -1){
						distance = point_distance(mouse_x, mouse_y, defender_id.x, defender_id.y)
							if(i=0 or nearest_distance >= distance){
								var nearest_defender = defender_id;
								var nearest_distance = distance;
							}
						}
						else if(grab_item_id = 23){//クリスタルをすでに装備していて、さらに装備させようとしている
							if(defender_id.itemslot[j] = 23 or defender_id.itemslot[j] = 24){
								break
							}
						}
					}
				}
				else{//アップグレードオーブならアイテムスロットがいっぱいでも使える
					distance = point_distance(mouse_x, mouse_y, defender_id.x, defender_id.y)
					if(i=0 or nearest_distance >= distance){
						var nearest_defender = defender_id;
						var nearest_distance = distance;
					}
				}
			}
			
			
			if(nearest_distance <= 32){
				var purchase_item = equip_item(grab_item_id, nearest_defender);//装備
				var drop_result = true;
				if(global.itemdata[grab_item_id, itemdata.upgraded] = -1){//アップグレードオーブで
					if(grab_item_possession_id = -1){//ショップで購入したオーブの場合
						purchased_upgrade_orb = true//あとで返金するために購入したオーブだということをいれておく
					}
					else{
						purchased_upgrade_orb = false
					}
				}
				if(grab_item_possession_id = -1){
					//if(purchase_item){shop_item_product[grab_item_shop_id, SALES] += 1;}//販売数増やす
				}
			}
			if(grab_item_possession_id = -1){
				if(!purchase_item){
					//返金
					shop_item_product[grab_item_shop_id, SALES] -= 1;//販売数戻す
					var return_gold = shop_item_product[grab_item_shop_id, COST];
					for(var j=0; j<shop_item_product[grab_item_shop_id, SALES]; j++){
						return_gold *= PRICE_INCREASE;
					}
					global.gold += floor(return_gold);
					play_se(SE_SHOP_BOUGHT_CANCEL, 40, 0.17, false);
					
				}
			}
			else{
				if(!purchase_item){
					global.item_possession[grab_item_possession_id] = grab_item_id;
					play_se(SE_SHOP_BOUGHT_CANCEL, 40, 0.17, false);
				}
			}
			grab_item_id = -1;
		}
		else{
			if(grab_item_possession_id = -1){//返金
				shop_item_product[grab_item_shop_id, SALES] -= 1;//販売数戻す
				var return_gold = shop_item_product[grab_item_shop_id, COST];
				for(var j=0; j<shop_item_product[grab_item_shop_id, SALES]; j++){
					return_gold *= PRICE_INCREASE;
				}
				global.gold += floor(return_gold);
				play_se(SE_SHOP_BOUGHT_CANCEL, 40, 0.2, false);
			}
			else{
				global.item_possession[grab_item_possession_id] = grab_item_id;
				play_se(SE_SHOP_BOUGHT_CANCEL, 40, 0.2, false);
			}
			grab_item_id = -1;
		}
	}
}

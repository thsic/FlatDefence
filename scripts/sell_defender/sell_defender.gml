///@param id

var sell_id = argument0;

var get_gold = 0;
for(var i=0; i<sell_id.itemslot_amount; i++){
	if(sell_id.itemslot[i] != -1){//アイテムを持っているならそれの値段もプラスする
		var item_id = sell_id.itemslot[i];
		var cellitem_shop_product_number = -1;
		for(var j=0; j<product_item_amount; j++){
			if(shop_item_product[j, ITEM] = item_id){
				cellitem_shop_product_number = j;
				break
			}
		}
		
		if(cellitem_shop_product_number = -1){
			if(global.itemdata[item_id, itemdata.upgraded]){
				//アップグレードアイテムはアップグレード前アイテム値段+オーブ値段
				//まずオーブがショップに存在するか確かめる
				var upgradeorb_shop_product_number = -1;
				for(var j=0; j<product_item_amount; j++){
					if(shop_item_product[j, ITEM] = 0){
						upgradeorb_shop_product_number = j;
						break
					}
				}
				//次にアップグレード前アイテムがショップに存在するかたしかめる
				var before_upgradeitem_shop_product_number = -1;
				for(var j=0; j<product_item_amount; j++){
					if(shop_item_product[j, ITEM] = item_id-1){//アップグレード前アイテム -1
						before_upgradeitem_shop_product_number = j;
						break
					}
				}
				if(upgradeorb_shop_product_number != -1){
					//オーブ存在する
					get_gold += shop_item_product[upgradeorb_shop_product_number, COST];
				}
				else{
					//存在しない
					get_gold += global.itemdata[0, itemdata.cost];
				}
				if(before_upgradeitem_shop_product_number != -1){
					//アップグレード前アイテム存在する
					get_gold += shop_item_product[before_upgradeitem_shop_product_number, COST];
				}
				else{
					//存在しない
					get_gold += global.itemdata[item_id, itemdata.cost];
				}
				
			}
			else{
				//shopに存在しないアイテムなのでデータベースから直接コストを呼び出す
				get_gold += global.itemdata[item_id, itemdata.cost];
			}
		}
		else{//shopに存在するアイテムならshopの値段で
			get_gold += shop_item_product[cellitem_shop_product_number, COST];
		}
	}
	else{
		break
	}
}
get_gold += global.defender_data[sell_id.defender_number, data.cost];

global.score_gold_minus += get_gold;//売却ゴールドはクリア時のスコアに加算されない
global.gold += get_gold;

play_se(SE_SELL_DEFENDER, 60, 0.3, false);
audio_sound_pitch(SE_SELL_DEFENDER, 1.2);

//弾消す
for(var i=0; i<instance_number(o_defender_bullet); i++){
	if(instance_find(o_defender_bullet, i).defender_id = finded_defender_id){
		instance_destroy(instance_find(o_defender_bullet, i));
	}
}

//defendermarkerを設置可能に
var marker_id = instance_position(finded_defender_id.x, finded_defender_id.y, o_defenderMarker)
if(marker_id != 0){
	marker_id.on_defender = false;
}

sdm(string(global.defender_data[sell_id.defender_number, data.name])+"を"+string(get_gold)+"goldで売却")
//defender消す
instance_destroy(finded_defender_id);



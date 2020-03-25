//射程内に敵がいるかどうか確認する 
//拠点に近い順から確認するのでselect_enemyがNEARGOALならこれで選ばれた敵がそのまま攻撃対象になる

var find_enemy_id = false;

if(global.enemy_amount != 0){//敵が居たら
	for(var i = 0; i < global.enemy_amount; i++){//敵の数だけループ
		if(instance_exists(global.enemy_neargoal_sorted_id[i])){
			//x座標で見て敵が射程内(defender.x-range <= 敵x座標 <= defender.x + range)に入っているなら 
			if(x-range <= global.enemy_neargoal_sorted_id[i].x and global.enemy_neargoal_sorted_id[i].x <= x+range){
				//敵との距離を測る
				if(point_distance(x, y, global.enemy_neargoal_sorted_id[i].x, global.enemy_neargoal_sorted_id[i].y) <= range){
					if(defender_number != 1){//sniper以外
						find_enemy_id = global.enemy_neargoal_sorted_id[i];//見つけた敵のidを入れる
						break;//forからぬける
					}
					else{//sniperなら最低射程内には撃てない
						if(point_distance(x, y, global.enemy_neargoal_sorted_id[i].x, global.enemy_neargoal_sorted_id[i].y) > SNIPER_MIN_RANGE){
							find_enemy_id = global.enemy_neargoal_sorted_id[i];//見つけた敵のidを入れる
							break;//forからぬける
						}
					}
				}
			}
		}
	}
}
return find_enemy_id//敵idかfalseが返される
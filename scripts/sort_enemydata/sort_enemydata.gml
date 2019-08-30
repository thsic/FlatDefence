///@param sorttype(hplow/hphigh/neargoal/-strong/-weak)
enum sorttype{
	hplow,
	hphigh,
	neargoal,
}

var sorttype = argument0;

switch(sorttype){
case sorttype.hplow:
case sorttype.hphigh:
	amount = global.enemy_hp;
	enemy_id = global.enemy_id;
	if(sorttype = sorttype.hplow){//昇順か降順か
		quicksort(amount, enemy_id, 0, global.enemy_amount-1, true);
		global.enemy_hplow_sorted_id = enemy_id;//ソート済みのidをグローバルへ
	}
	else{
		quicksort(amount, enemy_id, 0, global.enemy_amount-1, false);
		global.enemy_hphigh_sorted_id = enemy_id;
	}
break

case sorttype.neargoal://拠点に近い順
	amount = global.enemy_x;
	enemy_id = global.enemy_id
	quicksort(amount ,enemy_id , 0, global.enemy_amount-1, false);
	global.enemy_neargoal_sorted_id = enemy_id;
	global.enemy_neargoal_sorted = amount;
	sdm(global.enemy_id)
break

case other:
break
}

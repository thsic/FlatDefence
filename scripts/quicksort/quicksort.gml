///@param amount[],enemy_id[],first,last,ascending

var _amount = argument0;//ソートしたい変数
var _enemy_id = argument1;//対応した敵id
var first = argument2;//何個目の配列からソートか 基本0
var last = argument3;//何個目まで なんか-1しないといけないっぽい
var ascending = argument4;//昇順かどうか

var pivot = _amount[first];
var i = first;
var j = last;

repeat(1000){
	if(ascending){
		while(_amount[i] < pivot and i < last) i++;//pivotより大きい数が見つかるか右端にたどり着くまでループ
		while(pivot < _amount[j] and j > first) j--;//pivotより少ない数が見つかるか左端へたどり着くまでループ
	}
	else {
		while(_amount[i] > pivot and i < last) i++;//pivotより大きい数が見つかるか右端にたどり着くまでループ
		while(_amount[j] < pivot and j > first) j--;//pivotより少ない数が見つかるか左端へたどり着くまでループ
	}

	if(i >= j){//ぶつかった 
		amount = _amount;
		enemy_id = _enemy_id;
		if(first < i-1)quicksort(amount, enemy_id, first, i-1,ascending);
		if(j+1 < last)quicksort(amount, enemy_id, j+1, last, ascending);
		break;//リピートをブレイク
	}
	else {//ぶつからない
		var temp = _amount[i];//数字を入れ替える
		_amount[i] = _amount[j];
		_amount[j] = temp;
		//数値に対応した敵idも入れ替える
		temp = _enemy_id[i];
		_enemy_id[i] = _enemy_id[j];
		_enemy_id[j] = temp;
		i++;
		j--;

	}
}



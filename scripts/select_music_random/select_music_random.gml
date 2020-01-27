//次の曲を探します

repeat(50){
	//曲をランダムに決める 次の曲は今の曲とかぶらないようにする
	var nextmusic = irandom(global.music_total_amount-1);
	if(nextmusic != global.nowmusic_number){
		break
	}
}

return nextmusic

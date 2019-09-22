///@param itemid
var itemid = argument0;
var result = false
for(var i=0; i<POSSESSION_ITEM_MAX; i++){
	if(global.item_possession[i] = -1){//空き枠にいれる
		global.item_possession[i] = itemid;
		result = true
		break
	}
}

if(result){
	sdm(string(global.itemdata[itemid, itemdata.name])+"を入手")
}
else{
	sdm("error! get_item")
}
return result
///@param defender_id
//アイテムをどれか一つアップグレードする
var defender_id = argument0;

upgrade_ui = true;
upgrade_defender_id = defender_id;
show_window = true;
for(var i=0; i<upgrade_defender_id.itemslot_amount; i++){
	upgrade_button[i, upgradebutton.state] = 0;
	if(upgrade_defender_id.itemslot[i] != -1){
		if(global.itemdata[upgrade_defender_id.itemslot[i], itemdata.upgraded] = 0){//アップグレードできるかどうか
			upgrade_button[i, upgradebutton.possibleupgrade] = true
		}
		else{
			upgrade_button[i, upgradebutton.possibleupgrade] = false
		}
	}
}
//初期設定では選択されているアップグレードアイテムは0番のやつ
upgrade_button[0, upgradebutton.state] = 2;
choosing_upgrade_item_id = upgrade_defender_id.itemslot[0];
//アップグレード決定ボタン
upgrade_button[10, upgradebutton.state] = 0;

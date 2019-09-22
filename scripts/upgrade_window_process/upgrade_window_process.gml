//アップグレードウィンドウの処理

var x_offset = (view_wport[0]-SHOP_WINDOW_WIDTH-500)/2;
var y_offset = 40
var width = 550;//要調整
var height = view_hport[0]-60;
var button_sprite = s_upgradeButton
var button_sprite_width = sprite_get_width(button_sprite);
var button_sprite_height = sprite_get_height(button_sprite);
var closewindow = false;//ウィンドウを消すかどうか


#region アップグレードアイテム変更ボタン
var item_number = 0;
for(var i=0; i<upgrade_defender_id.itemslot_amount; i++){
	if(upgrade_defender_id.itemslot[i] != -1){
		item_number++
	}
}

switch(item_number){
case 1:
	upgrade_button[0, upgradebutton.sprite_x] = x_offset+width/2;
	upgrade_button[0, upgradebutton.sprite_y] = y_offset+100;
break
case 2:
	for(i=1; i<=2; i++){
		if(i=1){
			upgrade_button[i-1, upgradebutton.sprite_x] = x_offset+width/7*2
		}
		else{
			upgrade_button[i-1, upgradebutton.sprite_x] = x_offset+width/7*5
		}
		upgrade_button[i-1, upgradebutton.sprite_y] = y_offset+100;
	}
break
case 3:
	for(i=1; i<=3; i++){
		upgrade_button[i-1, upgradebutton.sprite_x] = x_offset+width/6*(i*2-1);
		upgrade_button[i-1, upgradebutton.sprite_y] = y_offset+100;
	}
break
case 4://アイテム4つの時だけ2段になる
	for(i=1; i<=4; i++){
		switch(i){
		case 1:
			upgrade_button[0, upgradebutton.sprite_x] = x_offset+width/7*2;
			upgrade_button[0, upgradebutton.sprite_y] = y_offset+80;
		break
		case 2:
			upgrade_button[1, upgradebutton.sprite_x] = x_offset+width/7*5;
			upgrade_button[1, upgradebutton.sprite_y] = y_offset+80;
		break
		case 3:
			upgrade_button[2, upgradebutton.sprite_x] = x_offset+width/7*2;
			upgrade_button[2, upgradebutton.sprite_y] = y_offset+132;
		break
		case 4:
			upgrade_button[3, upgradebutton.sprite_x] = x_offset+width/7*5;
			upgrade_button[3, upgradebutton.sprite_y] = y_offset+132;
		}
	}
break
}

//アップグレード決定ボタン(-1)
upgrade_button[10, upgradebutton.sprite_x] = x_offset+width/2-button_sprite_width/2;
upgrade_button[10, upgradebutton.sprite_y] = y_offset+height-50-button_sprite_height/2;

//s_upgradeButtonは座標がtop leftなのでそれ用にずらす
for(i=0; i<item_number; i++){
	upgrade_button[i, upgradebutton.sprite_x] -= button_sprite_width/2
	upgrade_button[i, upgradebutton.sprite_y] -= button_sprite_height/2
}


#endregion

//マウスがボタンの上にあるとボタンがへこむ
for(var i=0; i<item_number; i++){
	if(upgrade_button[i, upgradebutton.state] = 1){
		upgrade_button[i, upgradebutton.state] = 0;
	}
	if(upgrade_button[i, upgradebutton.sprite_x] < mouse_x and mouse_x < upgrade_button[i, upgradebutton.sprite_x]+button_sprite_width){
		if(upgrade_button[i, upgradebutton.sprite_y] < mouse_y and mouse_y < upgrade_button[i, upgradebutton.sprite_y]+button_sprite_height){
			if(upgrade_button[i, upgradebutton.state] != 2){//すでに押されてるボタンではないなら
				upgrade_button[i, upgradebutton.state] = 1;//カーソルが上にある
			}
			if(mouse_check_button_pressed(mb_left)){
				for(var j=0; j<item_number; j++){
					upgrade_button[j, upgradebutton.state] = 0;//一旦全てのボタンを通常に戻してから↓
				}
				upgrade_button[i, upgradebutton.state] = 2;//クリックされたボタンを押す
				choosing_upgrade_item_id = upgrade_defender_id.itemslot[i]//現在選択されているitemのid
			}
		}
	}
}

//ウィンドウの外がクリックされたらウィンドウを消す
if(mouse_check_button_pressed(mb_left)){
	if(mouse_x < x_offset or x_offset+width < mouse_x or mouse_y < y_offset or y_offset+height < mouse_y){
		closewindow = true
		if(purchased_upgrade_orb){//返金
			global.gold += global.itemdata[0, itemdata.cost];
			purchased_upgrade_orb = false;
		}
		else{//所持品へ戻す
			get_item(0);
		}
	}
}

//アップグレード決定ボタン 処理内容は上とほぼ一緒
upgrade_button[10, upgradebutton.state] = 0
if(upgrade_button[10, upgradebutton.sprite_x] < mouse_x and mouse_x < upgrade_button[10, upgradebutton.sprite_x]+button_sprite_width){
	if(upgrade_button[10, upgradebutton.sprite_y] < mouse_y and mouse_y < upgrade_button[10, upgradebutton.sprite_y]+button_sprite_height){
		upgrade_button[10, upgradebutton.state] = 1;//カーソルが上にある
		
		if(mouse_check_button_pressed(mb_left)){
			upgrade_button[10, upgradebutton.state] = 2//アップグレード決定
		}
	}
}

//アップグレード処理
if(upgrade_button[10, upgradebutton.state] = 2){
	for(var i=0; i<item_number; i++){
		if(upgrade_button[i, upgradebutton.state] = 2){
			if(upgrade_button[i, upgradebutton.possibleupgrade] = true){//アップグレード可能かどうか判定
				if(global.itemdata[upgrade_defender_id.itemslot[i], itemdata.skill] != -1){//アイテムをアップグレードする前に元のスキルのクールダウンを保存
					var before_skill_cooldown = global.skilldata[global.itemdata[upgrade_defender_id.itemslot[i], itemdata.skill], skilldata.cooldown];
				}

				sdm(string(object_get_name(upgrade_defender_id.object_index))+"の"+string(global.itemdata[upgrade_defender_id.itemslot[i], itemdata.name])+"をアップグレード")
				upgrade_defender_id.itemslot[i] = global.itemdata[upgrade_defender_id.itemslot[i], itemdata.upgradeid];//アップグレードアイテムで上書き
				
				if(global.itemdata[upgrade_defender_id.itemslot[i], itemdata.skill] != -1){//スキル装備をアップグレードした時
					upgrade_defender_id.skill_id = global.itemdata[upgrade_defender_id.itemslot[i], itemdata.skill];
					//クールダウンを保持する
					var after_skill_cooldown = global.skilldata[global.itemdata[upgrade_defender_id.itemslot[i], itemdata.skill], skilldata.cooldown];
					var skill_cooldown_percent = upgrade_defender_id.skill_cooldown/before_skill_cooldown//今どれぐらいスキルのクールダウンが消化されてるか%
					upgrade_defender_id.skill_cooldown = after_skill_cooldown*skill_cooldown_percent//アップグレード後のスキルでその%だけクールダウンを消化
				}
				closewindow = true;
			}
		}
	}
}

if(closewindow){//ウィンドウ消す
	upgrade_ui = false;
	show_window = false;
	if(surface_exists(global.usefulwindow_surface[0])){
		surface_set_target(global.usefulwindow_surface[0]);
		draw_clear_alpha(c_black, 0);
		surface_reset_target();
		surface_free(global.usefulwindow_surface[0]);
	}
}
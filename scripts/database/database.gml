//データベース

enum data{
	object,
	damage,
	attack_speed,
	range,
	cost
}

#region defender data
//ここからデータ
var target = 0;
global.defender_data[target, data.object] = o_dBasic;
global.defender_data[target, data.damage] = 15;
global.defender_data[target, data.attack_speed] = 2;
global.defender_data[target, data.range] = 100;
global.defender_data[target, data.cost] = 100;

target = 1;
global.defender_data[target, data.object] = o_dSniper;
global.defender_data[target, data.damage] = 70;
global.defender_data[target, data.attack_speed] = 0.5;
global.defender_data[target, data.range] = 200;
global.defender_data[target, data.cost] = 150;

global.defender_category_amount = target+1;//今実装されているdefenderのかず

#endregion

enum itemdata{
	number,
	sprite,
	name,
	damage,
	attack_speed,
	range,
	cost,
	effect
}
#region item data
target = 0;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.sprite] = s_basicsword
global.itemdata[target, itemdata.name] = "BasicSword"
global.itemdata[target, itemdata.damage] = 20;
global.itemdata[target, itemdata.attack_speed] = 0.5;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 100;
global.itemdata[target, itemdata.effect] = false;

target = 1;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.sprite] = s_basicsword
global.itemdata[target, itemdata.name] = "PowerAxe"
global.itemdata[target, itemdata.damage] = 90;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 100;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = false;

global.item_category_amount = target+1;//今実装されているitemのかず
#endregion
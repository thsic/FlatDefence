//データベース

enum data{
	object,
	damage,
	attack_speed,
	range,
	cost
}

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
global.defender_data[target, data.range] = 250;
global.defender_data[target, data.cost] = 150;


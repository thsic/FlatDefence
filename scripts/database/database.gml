//データベース

#region defender data
//ここからデータ
var target = 0;
global.defender_data[target, data.object] = o_dBasic;
global.defender_data[target, data.name] = "Basic"
global.defender_data[target, data.damage] = 15;
global.defender_data[target, data.attack_speed] = 2;
global.defender_data[target, data.range] = 100;
global.defender_data[target, data.cost] = 100;
global.defender_data[target, data.description] = "be-sikku";

target = 1;
global.defender_data[target, data.object] = o_dSniper;
global.defender_data[target, data.name] = "Sniper"
global.defender_data[target, data.damage] = 70;
global.defender_data[target, data.attack_speed] = 0.5;
global.defender_data[target, data.range] = 200;
global.defender_data[target, data.cost] = 150;
global.defender_data[target, data.description] = "sunaipa-";

global.defender_category_amount = target+1;//今実装されているdefenderのかず
enum data{
	object,
	name,
	damage,
	attack_speed,
	range,
	cost,
	description
}
#endregion

#region item data
target = 0;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = -1;//アップグレードさせることができるアイテム
global.itemdata[target, itemdata.upgradeid] = -1
global.itemdata[target, itemdata.sprite] = s_upgradeOrb
global.itemdata[target, itemdata.name] = "UpgradeOrb"
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 300;
global.itemdata[target, itemdata.effect] = false;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "item wo upgrade dekiru";

target = 1;//basicsword
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_basicsword
global.itemdata[target, itemdata.name] = "BasicSword"
global.itemdata[target, itemdata.damage] = 20;
global.itemdata[target, itemdata.attack_speed] = 0.5;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 100;
global.itemdata[target, itemdata.effect] = false;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "item setumei 1";
target = 2;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_basicsword
global.itemdata[target, itemdata.name] = "BasicSword+"
global.itemdata[target, itemdata.damage] = 40;
global.itemdata[target, itemdata.attack_speed] = 1;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 100;
global.itemdata[target, itemdata.effect] = false;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "upgrade!";

target = 3;//poweraxe
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_basicsword
global.itemdata[target, itemdata.name] = "PowerAxe"
global.itemdata[target, itemdata.damage] = 90;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 100;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = false;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "item setumei 2";
target = 4;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_basicsword
global.itemdata[target, itemdata.name] = "PowerAxe+"
global.itemdata[target, itemdata.damage] = 120;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 150;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = false;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "item setumei 2";

target = 5;//powerup
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_attackup
global.itemdata[target, itemdata.name] = "PowerUp"
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = false;
global.itemdata[target, itemdata.skill] = 0;
global.itemdata[target, itemdata.description] = "kougeki 1.5bai";
target = 6;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_attackup
global.itemdata[target, itemdata.name] = "PowerUp+"
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = false;
global.itemdata[target, itemdata.skill] = 1;
global.itemdata[target, itemdata.description] = "kougeki 2bai";

global.item_category_amount = target+1;//今実装されているitemのかず

enum itemdata{
	number,
	upgraded,
	upgradeid,
	sprite,
	name,
	damage,
	attack_speed,
	range,
	cost,
	effect,
	skill,
	description
}
#endregion

#region Skill
target = 0;
global.skilldata[target, skilldata.number] = target;
global.skilldata[target, skilldata.name] = "AttackUp";
global.skilldata[target, skilldata.cooldown] = 15*FPS_DEFAULT;
global.skilldata[target, skilldata.skilltime] = 5*FPS_DEFAULT;
global.skilldata[target, skilldata.magnification] = 1.5;
global.skilldata[target, skilldata.magnification_type] = 0;//attack
global.skilldata[target, skilldata.effect] = -1;

target = 1;
global.skilldata[target, skilldata.number] = target;
global.skilldata[target, skilldata.name] = "AttackUp+";
global.skilldata[target, skilldata.cooldown] = 5*FPS_DEFAULT;
global.skilldata[target, skilldata.skilltime] = 5*FPS_DEFAULT;
global.skilldata[target, skilldata.magnification] = 2;
global.skilldata[target, skilldata.magnification_type] = 0;//attack
global.skilldata[target, skilldata.effect] = -1;



global.skill_category_amount = target+1;

enum skilldata{
	number,
	name,
	cooldown,
	skilltime,
	magnification,
	magnification_type,
	effect
}
#endregion
//データベース

#region defender data
//ここからデータ
var target = 0;
global.defender_data[target, data.object] = o_dBasic;
global.defender_data[target, data.name] = "Basic"
global.defender_data[target, data.description] = "be-sikku";
global.defender_data[target, data.damage] = 15;
global.defender_data[target, data.attack_speed] = 1.5;
global.defender_data[target, data.range] = 120;
global.defender_data[target, data.cost] = 100;
global.defender_data[target, data.itemslot] = 4;
global.defender_data[target, data.effect] = -1;
global.defender_data[target, data.effect2] = -1;

target = 1;
global.defender_data[target, data.object] = o_dSniper;
global.defender_data[target, data.name] = "Sniper"
global.defender_data[target, data.description] = "sunaipa-";
global.defender_data[target, data.damage] = 70;
global.defender_data[target, data.attack_speed] = 0.5;
global.defender_data[target, data.range] = 200;
global.defender_data[target, data.cost] = 150;
global.defender_data[target, data.itemslot] = 3;
global.defender_data[target, data.effect] = 23;
global.defender_data[target, data.effect2] = -1;

target = 2;
global.defender_data[target, data.object] = o_dBomber;
global.defender_data[target, data.name] = "Bomber"
global.defender_data[target, data.description] = "boma-";
global.defender_data[target, data.damage] = 30;
global.defender_data[target, data.attack_speed] = 0.5;
global.defender_data[target, data.range] = 70;
global.defender_data[target, data.cost] = 250;
global.defender_data[target, data.itemslot] = 3;
global.defender_data[target, data.effect] = 0;
global.defender_data[target, data.effect2] = 0;

target = 3;
global.defender_data[target, data.object] = o_dFreezer;
global.defender_data[target, data.name] = "Freezer"
global.defender_data[target, data.description] = "huri-za-";
global.defender_data[target, data.damage] = 50;
global.defender_data[target, data.attack_speed] = 1;
global.defender_data[target, data.range] = 150;
global.defender_data[target, data.cost] = 200;
global.defender_data[target, data.itemslot] = 3;
global.defender_data[target, data.effect] = 2;
global.defender_data[target, data.effect2] = 13;

target = 4;
global.defender_data[target, data.object] = o_dBlaster;
global.defender_data[target, data.name] = "Blaster"
global.defender_data[target, data.description] = "burasuta-";
global.defender_data[target, data.damage] = 20;
global.defender_data[target, data.attack_speed] = 1;
global.defender_data[target, data.range] = 100;
global.defender_data[target, data.cost] = 200;
global.defender_data[target, data.itemslot] = 3;
global.defender_data[target, data.effect] = 21;
global.defender_data[target, data.effect2] = -1;

target = 5;
global.defender_data[target, data.object] = o_dThief;
global.defender_data[target, data.name] = "Thief"
global.defender_data[target, data.description] = "si-hu";
global.defender_data[target, data.damage] = 10;
global.defender_data[target, data.attack_speed] = 2;
global.defender_data[target, data.range] = 100;
global.defender_data[target, data.cost] = 120;
global.defender_data[target, data.itemslot] = 3;
global.defender_data[target, data.effect] = 22;
global.defender_data[target, data.effect2] = -1;

global.defender_category_amount = target+1;//今実装されているdefenderのかず
#region enum
enum data{
	object,
	name,
	damage,
	attack_speed,
	range,
	cost,
	description,
	effect,
	effect2,
	itemslot
}
#endregion
#endregion

#region item data
target = 0;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = -1;//アップグレードさせることができるアイテム
global.itemdata[target, itemdata.upgradeid] = -1;
global.itemdata[target, itemdata.sprite] = s_upgradeOrb;
global.itemdata[target, itemdata.name] = "UpgradeOrb";
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 300;
global.itemdata[target, itemdata.effect] = false;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "item wo upgrade dekiru";
global.itemdata[target, itemdata.description2] = ""

#region 1~6
target = 1;//basicsword
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_basicsword;
global.itemdata[target, itemdata.name] = "BasicSword";
global.itemdata[target, itemdata.damage] = 15;
global.itemdata[target, itemdata.attack_speed] = 0.3;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 100;
global.itemdata[target, itemdata.effect] = -1;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "";
global.itemdata[target, itemdata.description2] = ""
target = 2;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_basicsword;
global.itemdata[target, itemdata.name] = "BasicSword+";
global.itemdata[target, itemdata.damage] = 40;
global.itemdata[target, itemdata.attack_speed] = 1;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 100;
global.itemdata[target, itemdata.effect] = 9;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "";
global.itemdata[target, itemdata.description2] = "Equipped item is no effect"

target = 3;//poweraxe
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_powerAxe;
global.itemdata[target, itemdata.name] = "PowerAxe";
global.itemdata[target, itemdata.damage] = 90;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 130;
global.itemdata[target, itemdata.effect] = 10;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "";
global.itemdata[target, itemdata.description2] = ""
target = 4;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_powerAxe;
global.itemdata[target, itemdata.name] = "PowerAxe+";
global.itemdata[target, itemdata.damage] = 190;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 130;
global.itemdata[target, itemdata.effect] = 10;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "";
global.itemdata[target, itemdata.description2] = ""

target = 5;//powerup
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_attackup;
global.itemdata[target, itemdata.name] = "PowerUp";
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = -1;
global.itemdata[target, itemdata.skill] = 0;
global.itemdata[target, itemdata.description] = "kougeki 1.5bai";
global.itemdata[target, itemdata.description2] = ""
target = 6;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_attackup;
global.itemdata[target, itemdata.name] = "PowerUp+";
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = -1;
global.itemdata[target, itemdata.skill] = 1;
global.itemdata[target, itemdata.description] = "kougeki 2bai";
global.itemdata[target, itemdata.description2] = ""
#endregion
#region 7~12
target = 7;//demonsfire
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_demonsFire;
global.itemdata[target, itemdata.name] = "DemonsFire";
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 250;
global.itemdata[target, itemdata.effect] = 3;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "arayuru dame-zi wo +5";
global.itemdata[target, itemdata.description2] = ""
target = 8;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_demonsFire;
global.itemdata[target, itemdata.name] = "DemonsFire";
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 250;
global.itemdata[target, itemdata.effect] = 3;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "arayuru dame-zi wo +10";
global.itemdata[target, itemdata.description2] = ""

target = 9;//Reaper's Sickle
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_reapersSickle;
global.itemdata[target, itemdata.name] = "Reaper's Sickle";
global.itemdata[target, itemdata.damage] = 10;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 250;
global.itemdata[target, itemdata.effect] = 4;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "tekiwotaosuCooldown 40% kaisyou";
global.itemdata[target, itemdata.description2] = ""
target = 10;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_reapersSickle;
global.itemdata[target, itemdata.name] = "Reaper's Sickle+";
global.itemdata[target, itemdata.damage] = 20;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 250;
global.itemdata[target, itemdata.effect] = 4;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "tekiwotaosu saraniCooldown 40% kaisyou";
global.itemdata[target, itemdata.description2] = ""

target = 11;//Cursed Sword
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_cursedSword;
global.itemdata[target, itemdata.name] = "Cursed Sword";
global.itemdata[target, itemdata.damage] = 60;
global.itemdata[target, itemdata.attack_speed] = 1.5;
global.itemdata[target, itemdata.range] = 20;
global.itemdata[target, itemdata.cost] = 250;
global.itemdata[target, itemdata.effect] = 5;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "";
global.itemdata[target, itemdata.description2] = "Skill igaide tekini damage wo ataerarenai"
target = 12;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_cursedSword;
global.itemdata[target, itemdata.name] = "Cursed Sword+";
global.itemdata[target, itemdata.damage] = 110;
global.itemdata[target, itemdata.attack_speed] = 3;
global.itemdata[target, itemdata.range] = 20;
global.itemdata[target, itemdata.cost] = 250;
global.itemdata[target, itemdata.effect] = 5;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "";
global.itemdata[target, itemdata.description2] = "Skill igaide tekini damage wo ataerarenai";
#endregion
#region 13~18
target = 13;//Imperial Lance
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_imperialLance;
global.itemdata[target, itemdata.name] = "ImperialLance";
global.itemdata[target, itemdata.damage] = 40;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 350;
global.itemdata[target, itemdata.effect] = 6;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "3tai kanntuu";
global.itemdata[target, itemdata.description2] = "attack speed hangen";
target = 14;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_imperialLance;
global.itemdata[target, itemdata.name] = "ImperialLance+";
global.itemdata[target, itemdata.damage] = 40;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 20;
global.itemdata[target, itemdata.cost] = 350;
global.itemdata[target, itemdata.effect] = 7;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "zenninn kanntuu";
global.itemdata[target, itemdata.description2] = "attack speed hangen";

target = 15;//freezerod
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_freezeRod;
global.itemdata[target, itemdata.name] = "FreezeRod";
global.itemdata[target, itemdata.damage] = 10;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = 2;
global.itemdata[target, itemdata.skill] = -1;
target = 16;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_freezeRod;
global.itemdata[target, itemdata.name] = "FreezeRod+";
global.itemdata[target, itemdata.damage] = 10;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = 12;
global.itemdata[target, itemdata.skill] = -1;

target = 17;//BombArrow
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_bombArrow;
global.itemdata[target, itemdata.name] = "bombArrow";
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0.3;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = 0;
global.itemdata[target, itemdata.skill] = -1;
target = 18;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_bombArrow;
global.itemdata[target, itemdata.name] = "bombArrow";
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0.3;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = 0;
global.itemdata[target, itemdata.skill] = -1;
#endregion
#region 19~24
target = 19;//LaserBeam
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_laserBeam;
global.itemdata[target, itemdata.name] = "LaserBeam";
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 20;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = 1;
global.itemdata[target, itemdata.skill] = -1;
target = 20;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_laserBeam;
global.itemdata[target, itemdata.name] = "LaserBeam+";
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 80;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = 1;
global.itemdata[target, itemdata.skill] = -1;

target = 21;//titansclub
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_titansClub;
global.itemdata[target, itemdata.name] = "TitansClub";
global.itemdata[target, itemdata.damage] = 30;
global.itemdata[target, itemdata.attack_speed] = 0.2;
global.itemdata[target, itemdata.range] = 20;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = 14;
global.itemdata[target, itemdata.skill] = -1;
target = 22;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_titansClub;
global.itemdata[target, itemdata.name] = "TitansClub+";
global.itemdata[target, itemdata.damage] = 30;
global.itemdata[target, itemdata.attack_speed] = 0.2;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = 14;
global.itemdata[target, itemdata.skill] = -1;

target = 23;//Crystal
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_Crystal;
global.itemdata[target, itemdata.name] = "Crystal";
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 300;
global.itemdata[target, itemdata.effect] = -1;
global.itemdata[target, itemdata.skill] = -1;
target = 24;//Crystal
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_Crystal;
global.itemdata[target, itemdata.name] = "Crystal+";
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 300;
global.itemdata[target, itemdata.effect] = -1;
global.itemdata[target, itemdata.skill] = -1;
#endregion

global.item_category_amount = target+1;//今実装されているitemのかず
#region enum
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
	description,
	description2
}

enum itemnumber{
	UpgradeOrb,
	BasicSword,
	UpgBasicSword,
	PowerAxe,
	UpgPowerAxe,
	PowerUp,
	UpgPowerUp,
}
#endregion
#endregion

#region Skill data
target = 0;
global.skilldata[target, skilldata.number] = target;
global.skilldata[target, skilldata.name] = "AttackUp";
global.skilldata[target, skilldata.cooldown] = 15*FPS_DEFAULT;
global.skilldata[target, skilldata.skilltime] = 5*FPS_DEFAULT;
global.skilldata[target, skilldata.description1] = "kougeki 1.5";
global.skilldata[target, skilldata.description2] = "";
global.skilldata[target, skilldata.magnification] = 1.5;
global.skilldata[target, skilldata.magnification_type] = 0;//attack
global.skilldata[target, skilldata.effect] = -1;

target = 1;
global.skilldata[target, skilldata.number] = target;
global.skilldata[target, skilldata.name] = "AttackUp+";
global.skilldata[target, skilldata.cooldown] = 15*FPS_DEFAULT;
global.skilldata[target, skilldata.skilltime] = 5*FPS_DEFAULT;
global.skilldata[target, skilldata.description1] = "kougeki 2";
global.skilldata[target, skilldata.description1] = "";
global.skilldata[target, skilldata.magnification] = 2;
global.skilldata[target, skilldata.magnification_type] = 0;//attack
global.skilldata[target, skilldata.effect] = -1;


global.skill_category_amount = target+1;
#region enum
enum skilldata{
	number,
	name,
	cooldown,
	skilltime,
	magnification,
	magnification_type,
	effect,
	description1,
	description2,
}
#endregion
#endregion

#region Enemy data
target = 0;
global.enemydata[target, enemydata.object] = o_eNormal;
global.enemydata[target, enemydata.name] = "Normal";
global.enemydata[target, enemydata.hp] = 150;
global.enemydata[target, enemydata.shield] = 15;
global.enemydata[target, enemydata.speed] = 1;
global.enemydata[target, enemydata.description] = "hutuu";
global.enemydata[target, enemydata.dropgold] = 10;

target = 1;
global.enemydata[target, enemydata.object] = o_eFast;
global.enemydata[target, enemydata.name] = "Fast";
global.enemydata[target, enemydata.hp] = 50;
global.enemydata[target, enemydata.shield] = 3;
global.enemydata[target, enemydata.speed] = 3;
global.enemydata[target, enemydata.description] = "hayaizo";
global.enemydata[target, enemydata.dropgold] = 12;

global.enemy_category_amount = target+1;
#region enum
enum enemydata{
	object,
	name,
	hp,
	shield,
	speed,
	description,
	dropgold
}
#endregion
#endregion

#region Effect data

#region 0~5
target = 0;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "kougeki bakuhuu";
global.effectdata[target, effectdata.description] = "kougekiga bakuhuuni narimasu";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = true;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;//アップグレードする時に指定のエフェクトを消す

target = 1;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "zokusei fire";
global.effectdata[target, effectdata.description] = "kougekiga shield wo kantuu";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 2;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "zokusei ice";
global.effectdata[target, effectdata.description] = "tekiwo osoku suru";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = true;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = 11;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 3;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "demonsfire";
global.effectdata[target, effectdata.description] = "arayuru kougeki +5";
global.effectdata[target, effectdata.value] = 5;
global.effectdata[target, effectdata.overlap] = true;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 4;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "Cooldown kaisyo rod";
global.effectdata[target, effectdata.description] = "tekiwo taosu 40%";
global.effectdata[target, effectdata.value] = 0.4;
global.effectdata[target, effectdata.overlap] = true;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 5;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "Cursed";
global.effectdata[target, effectdata.description] = "Skill igai de no damageaaaa@aaaaaaaaaaaaaaaaaaaaaaaa";//スキル以外でダメージを与えられない
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_RED;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

#endregion
#region 6~10
target = 6;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "Kantu";
global.effectdata[target, effectdata.description] = "3tai kantu";
global.effectdata[target, effectdata.value] = 3;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = 8;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 7;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "Kantu";
global.effectdata[target, effectdata.description] = "zenninn kantu";
global.effectdata[target, effectdata.value] = -1;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = 8;
global.effectdata[target, effectdata.deleteeffect] = 6

target = 8;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "attack speed hangen";
global.effectdata[target, effectdata.description] = "attack speed hangen";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_RED;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 9;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "True Basic";
global.effectdata[target, effectdata.description] = "Equipped item is no effect";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_RED;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 10;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "Range hangen";
global.effectdata[target, effectdata.description] = "syatei hangen";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_RED;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;
#endregion
#region 11~15
target = 11;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "Damage hangen";
global.effectdata[target, effectdata.description] = "dame-zi hangen";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_RED;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 12;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "nandemo ice";
global.effectdata[target, effectdata.description] = "arayuru ice";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = 2;
global.effectdata[target, effectdata.deleteeffect] = 2;

target = 13;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "kougeki hangen mukou";
global.effectdata[target, effectdata.description] = "kougeki hangen mukou";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 14;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "Shield Bleak";
global.effectdata[target, effectdata.description] = "si-rudo bureiku +3";
global.effectdata[target, effectdata.value] = 3;
global.effectdata[target, effectdata.overlap] = true;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 15;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "Item slot+2";
global.effectdata[target, effectdata.description] = "aitemu hueru";
global.effectdata[target, effectdata.value] = 2;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;
#endregion
#region 16=20
target = 16;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "Range x2";
global.effectdata[target, effectdata.description] = "range 2bai";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = true;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 17;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "bakuhuu dmgup";
global.effectdata[target, effectdata.description] = "mannnaka damageup";
global.effectdata[target, effectdata.value] = 1.5;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 18;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "hanni slow";
global.effectdata[target, effectdata.description] = "zenbu slow";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 19;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "rensyasokudo dansoku up";
global.effectdata[target, effectdata.description] = "hayai ne";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 20;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "gold get plus";
global.effectdata[target, effectdata.description] = "gold x1.2";
global.effectdata[target, effectdata.value] = 0.2;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;
#endregion
#region 21~25
target = 21;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "3ren kougeki";
global.effectdata[target, effectdata.description] = "VH";
global.effectdata[target, effectdata.value] = 3;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 22;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "gold get";
global.effectdata[target, effectdata.description] = "teki taosu +3G";
global.effectdata[target, effectdata.value] = 3;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 23;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "One Shot One Kill";
global.effectdata[target, effectdata.description] = "150+ range teki dmgx1.5";
global.effectdata[target, effectdata.value] = 1.5;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 24;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "Basicist";
global.effectdata[target, effectdata.description] = "basicsword zidou upgrade";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 25;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "One_Shot_One_Kill+";
global.effectdata[target, effectdata.description] = "250+ range teki dmgx2";
global.effectdata[target, effectdata.value] = 2;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;
#endregion
#region 26~30
target = 26;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "bakuhuu onhit";
global.effectdata[target, effectdata.description] = "mannnaka onhit effect";
global.effectdata[target, effectdata.value] = 2;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 27;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "hanni dot dmg";
global.effectdata[target, effectdata.description] = "range zenninn dmg";
global.effectdata[target, effectdata.value] = 0.2;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 28;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "7ren kougeki";
global.effectdata[target, effectdata.description] = "7ren kougeki";
global.effectdata[target, effectdata.value] = 7;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = 11;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 29;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "Item Steel";
global.effectdata[target, effectdata.description] = "shop hitotu muryou";
global.effectdata[target, effectdata.value] = 1;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;
#endregion
global.effect_category_amount = target+1;
#region enum
enum effectdata{
	number,
	name,
	description,
	value,
	overlap,
	color,
	addeffect,
	deleteeffect
}

#endregion
#endregion
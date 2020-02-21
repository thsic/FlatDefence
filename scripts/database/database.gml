//データベース

#region defender data
//ここからデータ
var target = 0;
global.defender_data[target, data.object] = o_dBasic;
global.defender_data[target, data.name] = "ベーシック"
global.defender_data[target, data.description] = "ステータスが低いが安く、アイテム枠が多い";
global.defender_data[target, data.damage] = 15;
global.defender_data[target, data.attack_speed] = 1;
global.defender_data[target, data.range] = 120;
global.defender_data[target, data.cost] = 50;
global.defender_data[target, data.itemslot] = 4;
global.defender_data[target, data.effect] = -1;
global.defender_data[target, data.effect2] = -1;
global.defender_data[target, data.color] = make_color_rgb(91, 93, 153);//make_color_rgb(46, 49, 146);
global.defender_data[target, data.scalesprite] = s_basicScale;

target = 1;
global.defender_data[target, data.object] = o_dSniper;
global.defender_data[target, data.name] = "スナイパー"
global.defender_data[target, data.description] = "射程と攻撃力が高いが、攻撃速度が遅い";
global.defender_data[target, data.damage] = 70;
global.defender_data[target, data.attack_speed] = 0.5;
global.defender_data[target, data.range] = 200;
global.defender_data[target, data.cost] = 150;
global.defender_data[target, data.itemslot] = 3;
global.defender_data[target, data.effect] = 23;
global.defender_data[target, data.effect2] = -1;
global.defender_data[target, data.color] = make_color_rgb(102, 204, 151);//make_color_rgb(60, 184, 120);
global.defender_data[target, data.scalesprite] = s_sniperScale;

target = 2;
global.defender_data[target, data.object] = o_dBomber;
global.defender_data[target, data.name] = "ボマー"
global.defender_data[target, data.description] = "攻撃が当たると爆風が発生する";
global.defender_data[target, data.damage] = 30;
global.defender_data[target, data.attack_speed] = 0.5;
global.defender_data[target, data.range] = 70;
global.defender_data[target, data.cost] = 120;
global.defender_data[target, data.itemslot] = 3;
global.defender_data[target, data.effect] = 0;
global.defender_data[target, data.effect2] = 0;
global.defender_data[target, data.color] = make_color_rgb(203, 141, 121);//make_color_rgb(243, 108, 79);
global.defender_data[target, data.scalesprite] = s_bomberScale;

target = 3;
global.defender_data[target, data.object] = o_dFreezer;
global.defender_data[target, data.name] = "フリーザー"
global.defender_data[target, data.description] = "敵の速度を下げる";
global.defender_data[target, data.damage] = 50;
global.defender_data[target, data.attack_speed] = 1;
global.defender_data[target, data.range] = 150;
global.defender_data[target, data.cost] = 150;
global.defender_data[target, data.itemslot] = 3;
global.defender_data[target, data.effect] = 2;
global.defender_data[target, data.effect2] = 13;
global.defender_data[target, data.color] = make_color_rgb(151, 202, 217);//make_color_rgb(125, 167, 217);
global.defender_data[target, data.scalesprite] = s_freezerScale;

target = 4;
global.defender_data[target, data.object] = o_dBlaster;
global.defender_data[target, data.name] = "ブラスター"
global.defender_data[target, data.description] = "三連攻撃をする";
global.defender_data[target, data.damage] = 20;
global.defender_data[target, data.attack_speed] = 0.7;
global.defender_data[target, data.range] = 100;
global.defender_data[target, data.cost] = 200;
global.defender_data[target, data.itemslot] = 3;
global.defender_data[target, data.effect] = 21;
global.defender_data[target, data.effect2] = -1;
global.defender_data[target, data.color] = make_color_rgb(163, 155, 229);//make_color_rgb(135, 129, 190);
global.defender_data[target, data.scalesprite] = s_blasterScale;

target = 5;
global.defender_data[target, data.object] = o_dThief;
global.defender_data[target, data.name] = "シーフ"
global.defender_data[target, data.description] = "敵を倒した際追加ゴールドを入手できる";
global.defender_data[target, data.damage] = 25;
global.defender_data[target, data.attack_speed] = 1.5;
global.defender_data[target, data.range] = 100;
global.defender_data[target, data.cost] =100;
global.defender_data[target, data.itemslot] = 3;
global.defender_data[target, data.effect] = 22;
global.defender_data[target, data.effect2] = -1;
global.defender_data[target, data.color] = make_color_rgb(243, 170, 199);//make_color_rgb(244, 154, 194);
global.defender_data[target, data.scalesprite] = s_thiefScale;

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
	itemslot,
	color,
	scalesprite
}
#endregion
#endregion

#region item data
target = 0;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = -1;//アップグレードさせることができるアイテム
global.itemdata[target, itemdata.upgradeid] = -1;
global.itemdata[target, itemdata.sprite] = s_upgradeOrb;
global.itemdata[target, itemdata.name] = "アップグレードオーブ";
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
global.itemdata[target, itemdata.name] = "ベーシックソード";
global.itemdata[target, itemdata.damage] = 15;
global.itemdata[target, itemdata.attack_speed] = 0.2;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 70;
global.itemdata[target, itemdata.effect] = -1;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "";
global.itemdata[target, itemdata.description2] = ""
target = 2;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_basicswordUpgrade;
global.itemdata[target, itemdata.name] = "ベーシックソード+";
global.itemdata[target, itemdata.damage] = 40;
global.itemdata[target, itemdata.attack_speed] = 0.7;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 70;
global.itemdata[target, itemdata.effect] = 9;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "";
global.itemdata[target, itemdata.description2] = "装備アイテムの効果が消えます"

target = 3;//poweraxe
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_powerAxe;
global.itemdata[target, itemdata.name] = "鋼鉄の斧";
global.itemdata[target, itemdata.damage] = 60;
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
global.itemdata[target, itemdata.sprite] = s_powerAxeUpgrade;
global.itemdata[target, itemdata.name] = "鋼鉄の斧+";
global.itemdata[target, itemdata.damage] = 130;
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
global.itemdata[target, itemdata.name] = "悪魔の炎";
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
global.itemdata[target, itemdata.sprite] = s_demonsFireUpgrade;
global.itemdata[target, itemdata.name] = "悪魔の炎";
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
global.itemdata[target, itemdata.name] = "死神の鎌";
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
global.itemdata[target, itemdata.sprite] = s_reapersSickleUpgrade;
global.itemdata[target, itemdata.name] = "死神の鎌+";
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
global.itemdata[target, itemdata.name] = "呪われた剣";
global.itemdata[target, itemdata.damage] = 10;
global.itemdata[target, itemdata.attack_speed] = 1.5;
global.itemdata[target, itemdata.range] = 20;
global.itemdata[target, itemdata.cost] = 250;
global.itemdata[target, itemdata.effect] = 5;
global.itemdata[target, itemdata.skill] = -1;
global.itemdata[target, itemdata.description] = "";
global.itemdata[target, itemdata.description2] = "Skill igaide tekini damage wo ataerarenai"
target = 12;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_cursedSwordUpgrade;
global.itemdata[target, itemdata.name] = "呪われた剣+";
global.itemdata[target, itemdata.damage] = 20;
global.itemdata[target, itemdata.attack_speed] = 3;
global.itemdata[target, itemdata.range] = 30;
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
global.itemdata[target, itemdata.name] = "インペリアルランス";
global.itemdata[target, itemdata.damage] = 30;
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
global.itemdata[target, itemdata.sprite] = s_imperialLanceUpgrade;
global.itemdata[target, itemdata.name] = "インペリアルランス+";
global.itemdata[target, itemdata.damage] = 30;
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
global.itemdata[target, itemdata.name] = "フリーズロッド";
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
global.itemdata[target, itemdata.sprite] = s_freezeRodUpgrade;
global.itemdata[target, itemdata.name] = "フリーズロッド+";
global.itemdata[target, itemdata.damage] = 20;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 30;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = 12;
global.itemdata[target, itemdata.skill] = -1;

target = 17;//BombArrow
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_bombArrow;
global.itemdata[target, itemdata.name] = "ボムアロー";
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0.1;
global.itemdata[target, itemdata.range] = 10;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = 0;
global.itemdata[target, itemdata.skill] = -1;
target = 18;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_bombArrowUpgrade;
global.itemdata[target, itemdata.name] = "ボムアロー";
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0.2;
global.itemdata[target, itemdata.range] = 10;
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
global.itemdata[target, itemdata.name] = "ビーム砲";
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
global.itemdata[target, itemdata.sprite] = s_laserBeamUpgrade;
global.itemdata[target, itemdata.name] = "ビーム砲+";
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 90;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = 1;
global.itemdata[target, itemdata.skill] = -1;

target = 21;//spikeknuckle
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_spikeKnuckle;
global.itemdata[target, itemdata.name] = "スパイクナックル";
global.itemdata[target, itemdata.damage] = 10;
global.itemdata[target, itemdata.attack_speed] = 0.3;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = 14;
global.itemdata[target, itemdata.skill] = -1;
target = 22;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_spikeKnuckleUpgrade;
global.itemdata[target, itemdata.name] = "スパイクナックル+";
global.itemdata[target, itemdata.damage] = 20;
global.itemdata[target, itemdata.attack_speed] = 0.6;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = 14;
global.itemdata[target, itemdata.skill] = -1;

target = 23;//Crystal
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_Crystal;
global.itemdata[target, itemdata.name] = "クリスタル";
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
global.itemdata[target, itemdata.sprite] = s_CrystalUpgrade;
global.itemdata[target, itemdata.name] = "クリスタル+";
global.itemdata[target, itemdata.damage] = 0;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 300;
global.itemdata[target, itemdata.effect] = -1;
global.itemdata[target, itemdata.skill] = -1;
#endregion
#region 24~30
target = 25;//poisonDagger
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_poisonDagger;
global.itemdata[target, itemdata.name] = "ポイズンダガー";
global.itemdata[target, itemdata.damage] = 15;
global.itemdata[target, itemdata.attack_speed] = 0.5;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 180;
global.itemdata[target, itemdata.effect] = 30;
global.itemdata[target, itemdata.skill] = -1;
target = 26;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_poisonDaggerUpgrade;
global.itemdata[target, itemdata.name] = "ポイズンダガー+";
global.itemdata[target, itemdata.damage] = 25;
global.itemdata[target, itemdata.attack_speed] = 1.2;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 180;
global.itemdata[target, itemdata.effect] = 30;
global.itemdata[target, itemdata.skill] = -1;

target = 27;//TitansClab
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 0;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_titansClub;
global.itemdata[target, itemdata.name] = "巨人のハンマー";
global.itemdata[target, itemdata.damage] = 30;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 200;
global.itemdata[target, itemdata.effect] = 31;
global.itemdata[target, itemdata.skill] = -1;
target = 28;
global.itemdata[target, itemdata.number] = target;
global.itemdata[target, itemdata.upgraded] = 1;
global.itemdata[target, itemdata.upgradeid] = target+1;
global.itemdata[target, itemdata.sprite] = s_titansClubUpgrade;
global.itemdata[target, itemdata.name] = "巨人のハンマー+";
global.itemdata[target, itemdata.damage] = 70;
global.itemdata[target, itemdata.attack_speed] = 0;
global.itemdata[target, itemdata.range] = 0;
global.itemdata[target, itemdata.cost] = 180;
global.itemdata[target, itemdata.effect] = 32;
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
#region 0~5
target = 0;
global.enemydata[target, enemydata.object] = o_eNormalLv1;
global.enemydata[target, enemydata.name] = "Normal Lv1";
global.enemydata[target, enemydata.hp] = 30;
global.enemydata[target, enemydata.shield] = 15;
global.enemydata[target, enemydata.speed] = 1;
global.enemydata[target, enemydata.description] = "hutuu";
global.enemydata[target, enemydata.dropgold] = 6;
enemy_param_meas_rank(target);

target = 1;
global.enemydata[target, enemydata.object] = o_eNormalLv2;
global.enemydata[target, enemydata.name] = "Normal Lv2";
global.enemydata[target, enemydata.hp] = 110;
global.enemydata[target, enemydata.shield] = 40;
global.enemydata[target, enemydata.speed] = 1;
global.enemydata[target, enemydata.description] = "hutuu";
global.enemydata[target, enemydata.dropgold] = 9;
enemy_param_meas_rank(target);

target = 2;
global.enemydata[target, enemydata.object] = o_eNormalLv3;
global.enemydata[target, enemydata.name] = "Normal Lv3";
global.enemydata[target, enemydata.hp] = 200;
global.enemydata[target, enemydata.shield] = 60;
global.enemydata[target, enemydata.speed] = 1;
global.enemydata[target, enemydata.description] = "hutuu";
global.enemydata[target, enemydata.dropgold] = 18;
enemy_param_meas_rank(target);

target = 3;
global.enemydata[target, enemydata.object] = o_eSmallLv1;
global.enemydata[target, enemydata.name] = "Small Lv1";
global.enemydata[target, enemydata.hp] = 15;
global.enemydata[target, enemydata.shield] = 5;
global.enemydata[target, enemydata.speed] = 1.5;
global.enemydata[target, enemydata.description] = "tiisai";
global.enemydata[target, enemydata.dropgold] = 3;
enemy_param_meas_rank(target);

target = 4;
global.enemydata[target, enemydata.object] = o_eSmallLv2;
global.enemydata[target, enemydata.name] = "Small Lv2";
global.enemydata[target, enemydata.hp] = 90;
global.enemydata[target, enemydata.shield] = 15;
global.enemydata[target, enemydata.speed] = 2;
global.enemydata[target, enemydata.description] = "tiisai";
global.enemydata[target, enemydata.dropgold] = 6;
enemy_param_meas_rank(target);

target = 5;
global.enemydata[target, enemydata.object] = o_eSmallLv3;
global.enemydata[target, enemydata.name] = "Small Lv3";
global.enemydata[target, enemydata.hp] = 190;
global.enemydata[target, enemydata.shield] = 20;
global.enemydata[target, enemydata.speed] = 2.5;
global.enemydata[target, enemydata.description] = "tiisai";
global.enemydata[target, enemydata.dropgold] = 12;
enemy_param_meas_rank(target);

#endregion
#region 6~11
target = 6;
global.enemydata[target, enemydata.object] = o_eFastLv1;
global.enemydata[target, enemydata.name] = "Fast Lv1";
global.enemydata[target, enemydata.hp] = 5;
global.enemydata[target, enemydata.shield] = 0;
global.enemydata[target, enemydata.speed] = 3;
global.enemydata[target, enemydata.description] = "hayai";
global.enemydata[target, enemydata.dropgold] = 4;
enemy_param_meas_rank(target);

target = 7;
global.enemydata[target, enemydata.object] = o_eFastLv2;
global.enemydata[target, enemydata.name] = "Fast Lv2";
global.enemydata[target, enemydata.hp] = 60;
global.enemydata[target, enemydata.shield] = 5;
global.enemydata[target, enemydata.speed] = 4;
global.enemydata[target, enemydata.description] = "hayai";
global.enemydata[target, enemydata.dropgold] = 8;
enemy_param_meas_rank(target);

target = 8;
global.enemydata[target, enemydata.object] = o_eFastLv3;
global.enemydata[target, enemydata.name] = "Fast Lv3";
global.enemydata[target, enemydata.hp] = 210;
global.enemydata[target, enemydata.shield] = 50;
global.enemydata[target, enemydata.speed] = 4.5;
global.enemydata[target, enemydata.description] = "hayai";
global.enemydata[target, enemydata.dropgold] = 16;
enemy_param_meas_rank(target);

target = 9;
global.enemydata[target, enemydata.object] = o_eShieldLv1;
global.enemydata[target, enemydata.name] = "Shield Lv1";
global.enemydata[target, enemydata.hp] = 60;
global.enemydata[target, enemydata.shield] = 60;
global.enemydata[target, enemydata.speed] = 0.8;
global.enemydata[target, enemydata.description] = "katai";
global.enemydata[target, enemydata.dropgold] = 12;
enemy_param_meas_rank(target);

target = 10;
global.enemydata[target, enemydata.object] = o_eShieldLv2;
global.enemydata[target, enemydata.name] = "Shield Lv2";
global.enemydata[target, enemydata.hp] = 290;
global.enemydata[target, enemydata.shield] = 90;
global.enemydata[target, enemydata.speed] = 0.7;
global.enemydata[target, enemydata.description] = "katai";
global.enemydata[target, enemydata.dropgold] = 24;
enemy_param_meas_rank(target);

target = 11;
global.enemydata[target, enemydata.object] = o_eShieldLv3;
global.enemydata[target, enemydata.name] = "Shield Lv3";
global.enemydata[target, enemydata.hp] = 750;
global.enemydata[target, enemydata.shield] = 260;
global.enemydata[target, enemydata.speed] = 0.6;
global.enemydata[target, enemydata.description] = "katai";
global.enemydata[target, enemydata.dropgold] = 48;
enemy_param_meas_rank(target);

#endregion
#region 12~17
target = 12;
global.enemydata[target, enemydata.object] = o_eToughLv1;
global.enemydata[target, enemydata.name] = "Tough Lv1";
global.enemydata[target, enemydata.hp] = 220;
global.enemydata[target, enemydata.shield] = 25;
global.enemydata[target, enemydata.speed] = 0.5;
global.enemydata[target, enemydata.description] = "tahu";
global.enemydata[target, enemydata.dropgold] = 20;
enemy_param_meas_rank(target);

target = 13;
global.enemydata[target, enemydata.object] = o_eToughLv2;
global.enemydata[target, enemydata.name] = "Tough Lv2";
global.enemydata[target, enemydata.hp] = 680;
global.enemydata[target, enemydata.shield] = 40;
global.enemydata[target, enemydata.speed] = 0.5;
global.enemydata[target, enemydata.description] = "tahu";
global.enemydata[target, enemydata.dropgold] = 40;
enemy_param_meas_rank(target);

target = 14;
global.enemydata[target, enemydata.object] = o_eToughLv3;
global.enemydata[target, enemydata.name] = "Tough Lv3";
global.enemydata[target, enemydata.hp] = 1400;
global.enemydata[target, enemydata.shield] = 100;
global.enemydata[target, enemydata.speed] = 0.5;
global.enemydata[target, enemydata.description] = "tahu";
global.enemydata[target, enemydata.dropgold] = 80;
enemy_param_meas_rank(target);

#endregion

global.enemy_category_amount = target+1;
#region enum
enum enemydata{
	object,
	name,
	hp,
	shield,
	speed,
	description,
	dropgold,
	hprank,
	shieldrank,
	speedrank,
	hptextcolor,
	shieldtextcolor,
	speedtextcolor,
}
#endregion
#endregion

#region Effect data

#region 0~5
target = 0;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "爆風攻撃";
global.effectdata[target, effectdata.description] = "敵にダメージを与えると@爆風が発生する";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = true;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;//アップグレードする時に指定のエフェクトを消す

target = 1;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "炎属性攻撃";
global.effectdata[target, effectdata.description] = "シールドを無視する";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 2;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "アイスマジック";
global.effectdata[target, effectdata.description] = "敵の速度を遅くする";//狙った敵のみ
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = true;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = 11;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 3;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "悪戯";
global.effectdata[target, effectdata.description] = "あらゆるダメージが\v上昇@する";
global.effectdata[target, effectdata.value] = 5;
global.effectdata[target, effectdata.overlap] = true;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 4;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "刈り取る者";
global.effectdata[target, effectdata.description] = "敵を倒すとクールダウンが@\%%解消される";
global.effectdata[target, effectdata.value] = 0.4;
global.effectdata[target, effectdata.overlap] = true;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 5;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "衰弱の呪い";
global.effectdata[target, effectdata.description] = "ダメージが0.1倍になる";//スキル以外でダメージを与えられない
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_RED;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

#endregion
#region 6~10
target = 6;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "ペネトレイト";
global.effectdata[target, effectdata.description] = "攻撃が3体まで貫通する";
global.effectdata[target, effectdata.value] = 3;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = 8;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 7;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "最強の矛";
global.effectdata[target, effectdata.description] = "攻撃が何体でも貫通する";
global.effectdata[target, effectdata.value] = -1;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = 8;
global.effectdata[target, effectdata.deleteeffect] = 6

target = 8;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "攻撃速度半減";
global.effectdata[target, effectdata.description] = "攻撃速度が半減する";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_RED;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 9;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "トゥルーベーシック";
global.effectdata[target, effectdata.description] = "アイテムの追加効果が無くなる";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_RED;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 10;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "射程半減";
global.effectdata[target, effectdata.description] = "射程が半減する";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_RED;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;
#endregion
#region 11~15
target = 11;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "攻撃半減";
global.effectdata[target, effectdata.description] = "攻撃力が半減する";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_RED;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 12;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "氷神の加護";
global.effectdata[target, effectdata.description] = "あらゆる攻撃でスローを与える@ようになる";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = 2;
global.effectdata[target, effectdata.deleteeffect] = 2;

target = 13;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "攻撃半減無効";
global.effectdata[target, effectdata.description] = "攻撃半減が無効になる";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 14;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "シールドブレイク";
global.effectdata[target, effectdata.description] = "敵のシールドを追加で\v削る";
global.effectdata[target, effectdata.value] = 3;
global.effectdata[target, effectdata.overlap] = true;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 15;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "追加バッグ";
global.effectdata[target, effectdata.description] = "アイテムスロットが2つ増える";
global.effectdata[target, effectdata.value] = 2;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;
#endregion
#region 16~20
target = 16;//sniper
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "スナイプモード";
global.effectdata[target, effectdata.description] = "射程が2倍になる";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 17;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "高性能爆薬";
global.effectdata[target, effectdata.description] = "爆風の中心の敵に対して@ダメージが1.5倍になる";
global.effectdata[target, effectdata.value] = 1.5;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 18;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "フロストフィールド";
global.effectdata[target, effectdata.description] = "射程内の敵すべてにスローを与える";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 19;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "強化ボウガン";
global.effectdata[target, effectdata.description] = "弾速と連射速度が上昇";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 20;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "盗賊の才能";
global.effectdata[target, effectdata.description] = "敵を倒した時の獲得Gが1.2倍になる";
global.effectdata[target, effectdata.value] = 0.2;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;
#endregion
#region 21~25
target = 21;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "三連攻撃";
global.effectdata[target, effectdata.description] = "攻撃が三連射になる";
global.effectdata[target, effectdata.value] = 3;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 22;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "盗み";
global.effectdata[target, effectdata.description] = "敵を倒すと追加で3Gを得る";
global.effectdata[target, effectdata.value] = 3;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 23;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "狙撃";
global.effectdata[target, effectdata.description] = "射程150以上離れた敵に対してダメージが1.5倍になる";
global.effectdata[target, effectdata.value] = 1.5;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 24;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "ベーシッキスト";
global.effectdata[target, effectdata.description] = "ベーシックソードが@自動的にアップグレードされる";
global.effectdata[target, effectdata.value] = 0;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 25;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "ワンショットワンキル";
global.effectdata[target, effectdata.description] = "射程250以上離れた敵に対して@ダメージが2倍になる";
global.effectdata[target, effectdata.value] = 2;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;
#endregion
#region 26~30
target = 26;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "テクニカルボム";
global.effectdata[target, effectdata.description] = "爆風の中心の敵は狙った敵として@処理される";
global.effectdata[target, effectdata.value] = 2;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 27;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "ブリザード";
global.effectdata[target, effectdata.description] = "1秒毎に射程内の敵すべてに@Powerの0.2倍のダメージが発生";
global.effectdata[target, effectdata.value] = 0.2;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 28;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "七連攻撃";
global.effectdata[target, effectdata.description] = "攻撃が七連射になる";
global.effectdata[target, effectdata.value] = 7;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = 11;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 29;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "金の弾丸";
global.effectdata[target, effectdata.description] = "攻撃が当たった時ゴールドを1%消費@消費したゴールドx10の追加ダメージ";//狙った敵のみ
global.effectdata[target, effectdata.value] = 10;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;

target = 30;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "毒の刃";
global.effectdata[target, effectdata.description] = "敵のHPが奇数ならPowerの0.3倍の@追加ダメージが\l回発生";//狙った敵のみ
global.effectdata[target, effectdata.value] = 1;
global.effectdata[target, effectdata.overlap] = true;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;
#endregion
#region 31~35
target = 31;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "ハンマーストライク";
global.effectdata[target, effectdata.description] = "敵のHPが最大なら@Powerの0.4倍の追加ダメージ";//狙った敵のみ
global.effectdata[target, effectdata.value] = 0.4;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = -1;
target = 32;
global.effectdata[target, effectdata.number] = target;
global.effectdata[target, effectdata.name] = "痛恨の一撃";
global.effectdata[target, effectdata.description] = "敵のHPが最大なら@Powerの1倍の追加ダメージ";//狙った敵のみ
global.effectdata[target, effectdata.value] = 1;
global.effectdata[target, effectdata.overlap] = false;
global.effectdata[target, effectdata.color] = COLOR_TEXT_BLUE;
global.effectdata[target, effectdata.addeffect] = -1;
global.effectdata[target, effectdata.deleteeffect] = 31;

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



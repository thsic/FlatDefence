///
var bgm_volume = global.bgm_volume;
var se_volume = global.se_volume;
var draw_damage = global.draw_damage;
var draw_range = global.draw_range_always;
var draw_cooldown = global.draw_cooldown;
var draw_enemyhp = global.draw_enemyhp;
var draw_enemy_param_simple = global.draw_enemy_param_simple;

ini_open("Option.ini");

ini_write_real("Option", "BgmVolume", bgm_volume);
ini_write_real("Option", "SeVolume", se_volume);
ini_write_real("Option", "DrawDamage", draw_damage);
ini_write_real("Option", "DrawRange", draw_range);
ini_write_real("Option", "DrawCooldown", draw_cooldown);
ini_write_real("Option", "DrawEnemyHp", draw_enemyhp);
ini_write_real("Option", "DrawEnemyParamSimple", draw_enemy_param_simple);
sdm("Option.iniにセーブ")

ini_close();


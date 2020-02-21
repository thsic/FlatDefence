//

sdm("Option.iniをロード")

ini_open("Option.ini");
global.bgm_volume = ini_read_real("Option", "BgmVolume", BGM_VOLUME_DEFAULT);
global.se_volume = ini_read_real("Option", "SeVolume", SE_VOLUME_DEFAULT);
global.draw_damage = ini_read_real("Option", "DrawDamage", DRAW_DAMAGE_DEFAULT);
global.draw_range_always = ini_read_real("Option", "DrawRange", DRAW_RANGE_ALWAYS_DEFAULT);
global.draw_cooldown = ini_read_real("Option", "DrawCooldown", DRAW_COOLDOWN_DEFAULT);
global.draw_enemyhp = ini_read_real("Option", "DrawEnemyHp", DRAW_ENEMYHP_DEFAULT);
global.draw_enemy_param_simple = ini_read_real("Option", "DrawEnemyParamSimple", DRAW_ENEMY_PARAM_SIMPLE_DEFAULT);

ini_close();


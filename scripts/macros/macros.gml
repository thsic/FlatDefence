#macro DEBUGMODE true
#macro FPS_DEFAULT 60
#macro START_ROOM r_test

//ソート
#macro NEARGOAL 0
#macro HPLOW 1
#macro HPHIGH 2

#macro DEFENDER 0
#macro SPRITE_X 1
#macro SPRITE_Y 2

#macro ITEM 0
#macro SPRITE 3

//shop
#macro POSSESSION_ITEM_MAX 12//持てるアイテムの数
#macro SHOP_WINDOW_WIDTH 256 

//
#macro REST_TIME 600//休憩時間の長さ
#macro SPRITE_SIZE 16
#macro SPAWN_ENEMY_TYPE_AMOUNT 5

#macro PAUSE_BUTTON vk_space
#macro DOUBLE_SPEED_BUTTON vk_control

//defender
#macro EFFECT_SLOT_MAX 10//持てるエフェクトの数 ちなみに10ももてない
#macro EFFECT_BLAST_SIZE 32
#macro FREEZE_STRENGTH 0.5//倍率
#macro SHIELD_BREAK_STRENGTH 1//シールド削り値

//timemachine
#macro TIMEMACHINE_WIDTH 244
#macro TIMEMACHINE_HEIGHT 112

//ステージセレクト
#macro STAGESELECT_BUTTON_WIDTH 300
#macro STAGESELECT_BUTTON_HEIGHT 48
#macro STAGESELECT_BUTTON_AMOUNT 5

//アイテム
#macro IMPERIALLANCE_PENETRATION_MAX 40//インペリアルランス+が貫通できる敵の数
#macro FREEZEROD_UPGRADE_

//説明
#macro ENEMY_HP_DESCRIPTION "敵の体力です。HPが0になった敵は消滅し、ゴールドを落とします。"
#macro ENEMY_SHIELD_DESCRIPTION "敵のシールドです。ダメージを数値分だけ軽減します。 1回攻撃を受ける毎に1減少します。"
#macro ENEMY_SPEED_DESCRIPTION "敵の速度です。高いほど速いです。"
#macro DEFENDER_DAMAGE_DESCRIPTION "現在の攻撃力です。どれだけシールドが高い敵でも1/10のダメージは与えることができます。"
#macro DEFENDER_ATTACK_SPEED_DESCRIPTION "現在の1秒間に攻撃できる回数です。高いほど攻撃回数が増えます。"
#macro DEFENDER_RANGE_DESCRIPTION "現在の射程です。高いほど遠くの敵に攻撃できます。"



//色
#macro COLOR_TEXT_GRAY c_gray
#macro COLOR_TEXT_DKGRAY c_dkgray
#macro COLOR_TEXT_WHITE c_white
#macro COLOR_TEXT_YELLOW c_yellow
#macro COLOR_TEXT_ORANGE c_orange
#macro COLOR_TEXT_GREEN c_lime
#macro COLOR_TEXT_RED c_red
#macro COLOR_TEXT_PURPLE c_fuchsia
#macro COLOR_TEXT_BLUE c_aqua
#macro COLOR_TEXT_DARKGREEN c_teal

#macro COLOR_CIRCLE_RANGE_COOLDOWN c_gray
#macro COLOR_CIRCLE_RANGE_IDLE c_aqua

#macro COLOR_DEFAULT c_white

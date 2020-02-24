#macro DEBUGMODE true
#macro FPS_DEFAULT 60
#macro START_ROOM r_title
#macro GAMENAME "FLAT DEFENCE"
#macro STAGE_AMOUNT 4

//ソート
#macro NEARGOAL 0
#macro HPLOW 1
#macro HPHIGH 2

#macro DEFENDER 0
#macro SPRITE_X 1
#macro SPRITE_Y 2
#macro SALES 4

#macro ITEM 0
#macro SPRITE 3

//shop
#macro POSSESSION_ITEM_MAX 12//持てるアイテムの数
#macro SHOP_WINDOW_WIDTH 256 
#macro PRICE_INCREASE 1.2//1つ買うごとに値上がりする倍率

//
#macro REST_TIME 600//休憩時間の長さ
#macro SPRITE_SIZE 16
#macro SPAWN_ENEMY_TYPE_AMOUNT 5
#macro ARROW_CREATE_COOLDOWN_DEFAULT 150//休憩時間に流れる敵ルート矢印の頻度

#macro PAUSE_BUTTON vk_space
#macro DOUBLE_SPEED_BUTTON vk_control

//defender
#macro EFFECT_SLOT_MAX 18//持てるエフェクトの数
#macro EFFECT_BLAST_SIZE 32
#macro FREEZE_STRENGTH 0.5//倍率
#macro SHIELD_BREAK_STRENGTH 1//シールド削り値
#macro FREEZE_SLOW_PERCENT 0.7//フリーズLV1にかかったときのスピード倍率 通常はLV2
#macro FREEZE_INTERVAL 60//フリーザークリスタルの時の範囲スローの発生頻度
#macro BLASTER_SHOT_COOLDOWN 10//ブラスターの連射中のクールダウン
#macro BLASTER_SHOT_COOLDOWN_UPGRADE 2
#macro MARKER_ENHANCEMENT_MAGNIFICATION 0.1 //マーカーのトークン1つにつき上昇するステータス倍率

//timemachine
#macro TIMEMACHINE_WIDTH 244
#macro TIMEMACHINE_HEIGHT 100

//ウェーブスタートボタン
#macro WAVESTART_BUTTON_X 150
#macro WAVESTART_BUTTON_Y 6

//ステージセレクト
#macro STAGESELECT_BUTTON_WIDTH 300
#macro STAGESELECT_BUTTON_HEIGHT 48
#macro STAGESELECT_BUTTON_AMOUNT 3

//スコア
#macro STAGECLEAR_SCORE 10000//ステージクリアしたときのボーナススコア
#macro LIFE_SCORE 1000//ライフ1ごとのスコア
#macro GOLD_SCORE 10//ゴールド1ごとのスコア

//アイテム
#macro IMPERIALLANCE_PENETRATION_MAX 40//インペリアルランス+が貫通できる敵の数
#macro FREEZEROD_UPGRADE_ 10//わからん なにこれ
#macro POISONDAGGER_MAGNIFICATION 0.3//ポイズンダガー装備中の追加ダメージ倍率
#macro CURSEDSWORD_MAGNIFICATION 0.1//呪いの剣装備中のダメージ倍率
#macro BLAST_MAGNIFICATION 0.25//爆風ダメージ倍率

//
#macro ENEMY_RANK_AMOUNT 10//ランクの個数

#macro CIRCLE_PRECISION 32//円の精度

//option
#macro BGM_VOLUME_DEFAULT 0.7
#macro SE_VOLUME_DEFAULT 0.7
#macro DRAW_DAMAGE_DEFAULT true
#macro DRAW_RANGE_ALWAYS_DEFAULT true
#macro DRAW_COOLDOWN_DEFAULT true
#macro DRAW_ENEMYHP_DEFAULT true
#macro DRAW_ENEMY_PARAM_SIMPLE_DEFAULT true

//説明
#macro ENEMY_HP_DESCRIPTION "敵の体力です。HPが0になった敵は消滅し、ゴールドを落とします。"
#macro ENEMY_SHIELD_DESCRIPTION "敵のシールドです。ダメージを数値分だけ軽減します。 1回攻撃を受ける毎に1減少します。"
#macro ENEMY_SPEED_DESCRIPTION "敵の速度です。高いほど速いです。"
#macro DEFENDER_DAMAGE_DESCRIPTION "現在の攻撃力です。どれだけシールドが高い敵でも1/10のダメージは与えることができます。"
#macro DEFENDER_ATTACK_SPEED_DESCRIPTION "現在の1秒間に攻撃できる回数です。高いほど攻撃回数が増えます。"
#macro DEFENDER_RANGE_DESCRIPTION "現在の射程です。高いほど遠くの敵に攻撃できます。"

#macro CRYSTAL_SHOP_DESCRIPTION "ディフェンダーごとの特殊な能力を開放"
#macro UPGRADEORB_SHOP_DESCRIPTION "装備したアイテムをアップグレードできる"
#macro MARKER_ENHANCEMENT_DESCRIPTION1 "ここに置くと"
#macro MARKER_ENHANCEMENT_DESCRIPTION2 "が"
#macro MARKER_ENHANCEMENT_DESCRIPTION3 "倍になります"


//テキスト
#macro FIRE_DAMAGE_TEXT "Power"
#macro RANGE_TEXT "Range"
#macro ATTACKSPEED_TEXT "AttackSpeed"
#macro FIRE_DAMAGE_MARKER_TEXT "パワー"
#macro ATTACKSPEED_MARKER_TEXT "攻撃速度"
#macro RANGE_MARKER_TEXT "射程"
#macro MOST_DAMAGING_DEFENDER_TEXT "最もダメージを与えたディフェンダー"

//色
#macro COLOR_TEXT_GRAY c_dkgray
#macro COLOR_TEXT_DKGRAY c_dkgray
#macro COLOR_TEXT_WHITE make_color_rgb(220, 220, 220)
#macro COLOR_TEXT_YELLOW make_color_rgb(255, 242, 128)
#macro COLOR_TEXT_ORANGE make_color_rgb(244, 172, 100)
#macro COLOR_TEXT_GREEN c_lime
#macro COLOR_TEXT_RED make_color_rgb(222, 40, 40)
#macro COLOR_TEXT_PURPLE c_fuchsia
#macro COLOR_TEXT_BLUE make_color_rgb(85, 230, 230)
#macro COLOR_TEXT_DARKGREEN c_teal
#macro COLOR_TEXT_LTGRAY c_gray
#macro COLOR_TEXT_STAGEUI make_color_rgb(76, 76, 76)
#macro COLOR_TEXT_LTGRAY_ONWINDOW make_color_rgb(110, 110, 110)
#macro COLOR_TEXT_WHITE_NEARGRAY make_color_rgb(200, 200, 200)

#macro COLOR_CIRCLE_RANGE_COOLDOWN c_gray
#macro COLOR_CIRCLE_RANGE_IDLE c_lime

#macro COLOR_BULLET_DEFAULT c_dkgray
#macro COLOR_BULLET_FREEZE c_aqua
#macro COLOR_BULLET_FIRE c_red
#macro COLOR_BULLET_MIX c_purple

#macro COLOR_BAR_COOLDOWN make_color_rgb(204, 197, 112)
#macro COLOR_BAR_COOLDOWN_UNDER c_gray
#macro COLOR_BAR_ENEMYHP make_color_rgb(230, 120, 90)
#macro COLOR_BAR_ENEMYHP_UNDER c_gray

#macro COLOR_BACKGROUND make_color_rgb(200, 200, 170)

#macro COLOR_TEXT_SHOP make_color_rgb(160, 160, 130)

#macro COLOR_ENEMY_PARAMTEXT_WEAK make_color_rgb(200, 200, 160)
#macro COLOR_ENEMY_PARAMTEXT_STRONG make_color_rgb(255, 160, 140)
#macro COLOR_WINDOW_BORDER make_color_rgb(200, 200, 180)

#macro COLOR_MARKER_POWER make_color_rgb(220, 30, 0)
#macro COLOR_MARKER_ATTACKSPEED make_color_rgb(70, 30, 190)
#macro COLOR_MARKER_RANGE make_color_rgb(0, 120, 60)
#macro COLOR_MARKER_GRAY c_gray


//パーティクル
#macro COLOR_LIFEBLOOD make_color_rgb(240, 30, 55)
#macro COLOR_ITEM_EFFECT make_color_rgb(255, 244, 71)
#macro COLOR_SKILL_ACTIVE_BASE c_purple
#macro COLOR_UPGRADE_STAR_EFFECT c_yellow
#macro COLOR_ITEM_EQUIP_EFFECT make_color_rgb(241, 241, 68)
#macro COLOR_UPGRADE_EFFECT make_color_rgb(144, 70, 183)

#macro COLOR_DEFAULT c_white

//フォント
#macro FONT_DEFAULT fo_kosugiMaru12
#macro FONT_SUPERBIG fo_notoSuperBig
#macro FONT_TITLE fo_ostrichSans48
#macro FONT_SHOP fo_noto24
#macro FONT_DAMAGE_VERYSMALL fo_yasa8
#macro FONT_DAMAGE_SMALL fo_yasa10
#macro FONT_DAMAGE_NORMAL fo_yasaNormal
#macro FONT_DAMAGE_BIG fo_yasa16
#macro FONT_STAGECLEAR_TEXT fo_noto24
#macro FONT_STAGECLEAR_TOTALSCORE fo_kosugiMaru16
#macro FONT_ENHANCEMENT_MARKER_TEXT fo_kosugiMaru8
#macro FONT_STAGESELECT_TOTALSCORE fo_notoSuperBig
#macro FONT_UPGRADETEXT fo_yasa10Ja
#macro FONT_UPGRADETEXT_SMALL fo_yasa8Ja
#macro FONT_SHOP_GOLD_PLUS fo_kosugiMaru8
#macro FONT_MENUBUTTON fo_kosugiMaru10Ja
#macro FONT_ENEMY_UI_PARAM fo_yasa10
#macro FONT_ITEMNAME fo_yasaNormal

//SE
#macro SE_ENEMY_HIT_BULLET a_hitBullet 
#macro SE_ENEMY_DESTROY a_breakEnemy
#macro SE_STAGESELECT_BUTTON_ON_MOUSE a_button1


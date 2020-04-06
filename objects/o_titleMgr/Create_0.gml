center_x = window_get_width()/2;
center_y = window_get_height()/2;
draw_set_circle_precision(CIRCLE_PRECISION);

load_score();//スコアをロード
load_option();

random_set_seed(date_current_datetime());
randomize();


change_room_frame_1 = -1
change_room = false

global.double_speed = false;
instance_create_layer(0, 0, "UI", o_bgmMgr);

global.debugmode = DEBUGMODE;

//saveファイルのテスト
/*ini_open("test.ini");
ini_write_real("Main","Hoge",0);
ini_close();

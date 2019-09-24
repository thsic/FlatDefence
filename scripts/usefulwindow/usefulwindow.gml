///@param spritepath,windownumber,x,y,width,height,scale,alpha
/*ウディタの万能ウィンドウっぽいやつ
-------------注意-------------
3の倍数のスプライトでないとバグるかも 
drawイベントの中に置きましょう
surfaceを使っている
createイベントで先に "global.usefulwindow_surface[0] = noone" と書いておく必要がある
要らなくなったら "surface_free(global.usefulwindow_surface[0])" と書いておく
------------------------------*/
/*window_numberメモ
0 defenderステータス表示
1 shopウィンドウ
2 shop説明用小窓
3 敵ステータス表示
4 その他ui
*/


var sprite_path = argument0
var window_number = argument1
var window_x = argument2
var window_y = argument3
var window_width = argument4
var window_height = argument5
var sprite_scale = argument6
var sprite_alpha = argument7



if(!surface_exists(global.usefulwindow_surface[window_number]))//surfaceが作られていないなら作る
{
	//仮のsurface作成(ここから抜き取ってウィンドウを描画する)
	var temp_surface = surface_create(sprite_get_width(sprite_path)*sprite_scale,sprite_get_height(sprite_path)*sprite_scale)
	global.usefulwindow_surface[window_number] = surface_create(window_width,window_height)//ウィンドウを描画するsurface
	surface_set_target(temp_surface)//仮セット
	draw_clear_alpha(c_black, 1);//黒塗りで初期化 とりあえずなので表示が変だったら抜け
	draw_sprite_ext(sprite_path,0,0,0,sprite_scale,sprite_scale,0,c_white,sprite_alpha)//仮の方にウィンドウ描画
	surface_reset_target()//仮タイム終了
	
	var sprite_width_div3 = sprite_get_width(sprite_path)/3*sprite_scale//スプライトのwidthを3で割った値
	var sprite_height_div3 = sprite_get_height(sprite_path)/3*sprite_scale//スプライトのheightを3で割った値
	
	surface_set_target(global.usefulwindow_surface[window_number])//ウィンドウの方セット
	//順番に左上、右上、左下、右下
	draw_surface_part(temp_surface,0,0,sprite_width_div3,sprite_height_div3,0,0)//左上
	draw_surface_part(temp_surface,sprite_width_div3*2,0,sprite_width_div3,sprite_height_div3,window_width-sprite_width_div3,0)//右上
	draw_surface_part(temp_surface,0,sprite_height_div3*2,sprite_width_div3,sprite_height_div3,0,window_height-sprite_height_div3)//左下
	draw_surface_part(temp_surface,sprite_width_div3*2,sprite_height_div3*2,sprite_width_div3,sprite_height_div3,window_width-sprite_width_div3,window_height-sprite_height_div3)//右下
	//順番に中央上、中央下、中央左、中央右
	draw_surface_part_ext(temp_surface,sprite_width_div3,0,sprite_width_div3,sprite_height_div3,sprite_width_div3,0,(window_width-sprite_width_div3*2)/sprite_width_div3,1,c_white,1)//最後のscaleのやつはwindowのでかさを求めてそこから角の分のdiv3*2を除いてそれをscale=1の時の値で割って完璧な長さにする
	draw_surface_part_ext(temp_surface,sprite_width_div3,sprite_height_div3*2,sprite_width_div3,sprite_height_div3,sprite_width_div3,window_height-sprite_height_div3,(window_width-sprite_width_div3*2)/sprite_width_div3,1,c_white,1)
	draw_surface_part_ext(temp_surface,0,sprite_height_div3,sprite_width_div3,sprite_height_div3,0,sprite_height_div3,1,(window_height-sprite_height_div3*2)/sprite_height_div3,c_white,1)
	draw_surface_part_ext(temp_surface,sprite_width_div3*2,sprite_height_div3,sprite_width_div3,sprite_height_div3,window_width-sprite_width_div3,sprite_height_div3,1,(window_height-sprite_height_div3*2)/sprite_height_div3,c_white,1)
	//中央
	draw_surface_part_ext(temp_surface,sprite_width_div3,sprite_height_div3,sprite_width_div3,sprite_height_div3,sprite_width_div3,sprite_height_div3,(window_width-sprite_width_div3*2)/sprite_width_div3,(window_height-sprite_height_div3*2)/sprite_height_div3,c_white,1)//ながい
	
	surface_reset_target()//開放
	surface_free(temp_surface)//仮の方はもう使わないので破棄
}
else//既に作られているなら
{
	draw_surface(global.usefulwindow_surface[window_number],window_x,window_y)
	//draw_surface_ext(o_gameMgr.usefulwindow_surface,window_x,window_y,sprite_scale,sprite_scale,0,c_white,sprite_alpha)//ウィンドウを描画
}

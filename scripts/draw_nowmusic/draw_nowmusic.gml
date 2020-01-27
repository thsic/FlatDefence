var music_number = global.nowmusic_number;
var music_time = global.nowmusic_time;
var music_name = global.musicdata[music_number, musicdata.musicname];
var music_creator = global.musicdata[music_number, musicdata.creatorname];
var music_length = global.musicdata[music_number, musicdata.length]-global.musicdata[music_number, musicdata.earlystop];
var draw_music_width = 134;
var rectangle_height = 2;//バーの高さ

//下に少し暗めの四角を敷く
/*draw_set_color(make_color_rgb(110, 110, 95));
draw_rectangle(view_wport[0]-draw_music_width, 0, view_wport[0], 36+rectangle_height, false)*/


//曲名と作曲者名表示
draw_set_font(fo_yasa10);
draw_set_color(COLOR_TEXT_WHITE);
draw_set_halign(fa_left);
draw_sprite(s_musicNowplay, 0, view_wport[0]-draw_music_width, 6)
draw_sprite(s_musicCreator, 0, view_wport[0]-draw_music_width, 20)
draw_text(view_wport[0]-draw_music_width+14, 6, music_name);
draw_text(view_wport[0]-draw_music_width+14, 20, music_creator);

draw_set_font(FONT_DEFAULT);


//時間バー表示
var time_percent = music_time/music_length
var rectangle_width = time_percent*draw_music_width;

draw_set_color(make_color_rgb(160, 160, 130));
draw_rectangle(view_wport[0]-draw_music_width, 36, view_wport[0]-draw_music_width+rectangle_width, 36+rectangle_height, false);
draw_set_color(COLOR_DEFAULT);
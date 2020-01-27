///@param musicnumber
var musicnumber = argument0;
var music_path = global.musicdata[musicnumber, musicdata.path];

audio_play_sound(music_path, 50, false);
global.nowmusic_number = musicnumber;
global.nowmusic_time = 0;


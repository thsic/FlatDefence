///@param musicnumber
var musicnumber = argument0;
var music_path = global.musicdata[musicnumber, musicdata.path];
var music_default_volume = global.musicdata[musicnumber, musicdata.volume];

audio_play_sound(music_path, 50, false);
audio_sound_gain(music_path, music_default_volume*global.bgm_volume, 0);
global.nowmusic_number = musicnumber;
global.nowmusic_time = 0;


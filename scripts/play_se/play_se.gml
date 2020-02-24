///@param index,priority,level
var index = argument0;
var priority = argument1;
var level = argument2;

if(audio_is_playing(index)){//すでに同じseが再生中なら音量をすごく小さくする
	level *= 0.3;
}

audio_play_sound(index, priority, false);
audio_sound_gain(index, global.se_volume*level, 0);



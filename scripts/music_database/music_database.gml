#region music data
var target = 0;
global.musicdata[target, musicdata.number] = target;//number
global.musicdata[target, musicdata.path] = a_americanWigeon;//ファイルid
global.musicdata[target, musicdata.musicname] = "American Wigeon";//曲名
global.musicdata[target, musicdata.creatorname] = "Chad Crouch";//作曲者
global.musicdata[target, musicdata.length] = audio_sound_length(a_americanWigeon)*FPS_DEFAULT;//ファイルの長さ
global.musicdata[target, musicdata.earlystop] = 120;//このフレームだけ早めに終わる (無音の時間を短くする)
global.musicdata[target, musicdata.volume] = audio_sound_get_gain(a_americanWigeon);//ボリューム

target = 1;
global.musicdata[target, musicdata.number] = target;
global.musicdata[target, musicdata.path] = a_cometsAndSparks;
global.musicdata[target, musicdata.musicname] = "Comets and Sparks";
global.musicdata[target, musicdata.creatorname] = "Sergey Cheremisinov";
global.musicdata[target, musicdata.length] = audio_sound_length(a_cometsAndSparks)*FPS_DEFAULT;
global.musicdata[target, musicdata.earlystop] = 360;
global.musicdata[target, musicdata.volume] = audio_sound_get_gain(a_cometsAndSparks);

target = 2;
global.musicdata[target, musicdata.number] = target;
global.musicdata[target, musicdata.path] = a_moonrise;
global.musicdata[target, musicdata.musicname] = "Moonrise";
global.musicdata[target, musicdata.creatorname] = "Chad Crouch";
global.musicdata[target, musicdata.length] = audio_sound_length(a_moonrise)*FPS_DEFAULT;
global.musicdata[target, musicdata.earlystop] = 180;
global.musicdata[target, musicdata.volume] = audio_sound_get_gain(a_moonrise);

target = 3;
global.musicdata[target, musicdata.number] = target;
global.musicdata[target, musicdata.path] = a_theHealing;
global.musicdata[target, musicdata.musicname] = "The Healing";
global.musicdata[target, musicdata.creatorname] = "Sergey Cheremisinov";
global.musicdata[target, musicdata.length] = audio_sound_length(a_theHealing)*FPS_DEFAULT;
global.musicdata[target, musicdata.earlystop] = 600;
global.musicdata[target, musicdata.volume] = audio_sound_get_gain(a_theHealing);

global.music_total_amount = target+1;
#region
enum musicdata{
	number,
	path,
	musicname,
	creatorname,
	length,
	earlystop,
	volume,
}
#endregion

#endregion
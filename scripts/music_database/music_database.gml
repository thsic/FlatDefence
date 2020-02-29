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
global.musicdata[target, musicdata.path] = a_moonrise;
global.musicdata[target, musicdata.musicname] = "Moonrise";
global.musicdata[target, musicdata.creatorname] = "Chad Crouch";
global.musicdata[target, musicdata.length] = audio_sound_length(a_moonrise)*FPS_DEFAULT;
global.musicdata[target, musicdata.earlystop] = 180;
global.musicdata[target, musicdata.volume] = audio_sound_get_gain(a_moonrise);

target = 2;
global.musicdata[target, musicdata.number] = target;
global.musicdata[target, musicdata.path] = a_lemonLime;
global.musicdata[target, musicdata.musicname] = "Lemon Lime";
global.musicdata[target, musicdata.creatorname] = "Brevyn";
global.musicdata[target, musicdata.length] = audio_sound_length(a_lemonLime)*FPS_DEFAULT;
global.musicdata[target, musicdata.earlystop] = 180;
global.musicdata[target, musicdata.volume] = audio_sound_get_gain(a_lemonLime);

target = 3;
global.musicdata[target, musicdata.number] = target;
global.musicdata[target, musicdata.path] = a_theHealing;
global.musicdata[target, musicdata.musicname] = "The Healing";
global.musicdata[target, musicdata.creatorname] = "Sergey Cheremisinov";
global.musicdata[target, musicdata.length] = audio_sound_length(a_theHealing)*FPS_DEFAULT;
global.musicdata[target, musicdata.earlystop] = 600;
global.musicdata[target, musicdata.volume] = audio_sound_get_gain(a_theHealing);

target = 4;
global.musicdata[target, musicdata.number] = target;
global.musicdata[target, musicdata.path] = a_iAlwaysBeAlienatedByOthers;
global.musicdata[target, musicdata.musicname] = "i always be alienated by others";
global.musicdata[target, musicdata.creatorname] = "ish10 yow1r0";
global.musicdata[target, musicdata.length] = audio_sound_length(a_iAlwaysBeAlienatedByOthers)*FPS_DEFAULT;
global.musicdata[target, musicdata.earlystop] = 0;
global.musicdata[target, musicdata.volume] = audio_sound_get_gain(a_iAlwaysBeAlienatedByOthers);

/*target = 5;
global.musicdata[target, musicdata.number] = target;
global.musicdata[target, musicdata.path] = a_lemonLime;
global.musicdata[target, musicdata.musicname] = "Lemon Lime";
global.musicdata[target, musicdata.creatorname] = "Brevyn";
global.musicdata[target, musicdata.length] = audio_sound_length(a_lemonLime)*FPS_DEFAULT;
global.musicdata[target, musicdata.earlystop] = 60;
global.musicdata[target, musicdata.volume] = audio_sound_get_gain(a_lemonLime);*/

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
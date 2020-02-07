#region music data
var target = 0;
global.musicdata[target, musicdata.number] = target;//number
global.musicdata[target, musicdata.path] = a_americanWigeon;//ファイルid
global.musicdata[target, musicdata.musicname] = "American Wigeon";//曲名
global.musicdata[target, musicdata.creatorname] = "Chad Crouch";//作曲者
global.musicdata[target, musicdata.length] = audio_sound_length(a_americanWigeon)*FPS_DEFAULT;//ファイルの長さ
global.musicdata[target, musicdata.earlystop] = 120;//このフレームだけ早めに終わる (無音の時間を短くする)

target = 1;
global.musicdata[target, musicdata.number] = target;
global.musicdata[target, musicdata.path] = a_cometsAndSparks;
global.musicdata[target, musicdata.musicname] = "Comets and Sparks";
global.musicdata[target, musicdata.creatorname] = "Sergey Cheremisinov";
global.musicdata[target, musicdata.length] = audio_sound_length(a_cometsAndSparks)*FPS_DEFAULT;
global.musicdata[target, musicdata.earlystop] = 360;

target = 2;
global.musicdata[target, musicdata.number] = target;
global.musicdata[target, musicdata.path] = a_organisms;
global.musicdata[target, musicdata.musicname] = "Organisms";
global.musicdata[target, musicdata.creatorname] = "Chad Crouch";
global.musicdata[target, musicdata.length] = audio_sound_length(a_organisms)*FPS_DEFAULT;
global.musicdata[target, musicdata.earlystop] = 180;

target = 3;
global.musicdata[target, musicdata.number] = target;
global.musicdata[target, musicdata.path] = a_moonrise;
global.musicdata[target, musicdata.musicname] = "Moonrise";
global.musicdata[target, musicdata.creatorname] = "Chad Crouch";
global.musicdata[target, musicdata.length] = audio_sound_length(a_moonrise)*FPS_DEFAULT;
global.musicdata[target, musicdata.earlystop] = 180;

target = 4;
global.musicdata[target, musicdata.number] = target;
global.musicdata[target, musicdata.path] = a_theHealing;
global.musicdata[target, musicdata.musicname] = "The Healing";
global.musicdata[target, musicdata.creatorname] = "Sergey Cheremisinov";
global.musicdata[target, musicdata.length] = audio_sound_length(a_theHealing)*FPS_DEFAULT;
global.musicdata[target, musicdata.earlystop] = 600;

global.music_total_amount = target+1;
#region
enum musicdata{
	number,
	path,
	musicname,
	creatorname,
	length,
	earlystop,
}
#endregion

#endregion
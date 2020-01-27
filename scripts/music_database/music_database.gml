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
global.musicdata[target, musicdata.path] = a_acrossTheRiver;
global.musicdata[target, musicdata.musicname] = "Across The River";
global.musicdata[target, musicdata.creatorname] = "Podington Bear";
global.musicdata[target, musicdata.length] = audio_sound_length(a_acrossTheRiver)*FPS_DEFAULT;
global.musicdata[target, musicdata.earlystop] = 180;

target = 2;
global.musicdata[target, musicdata.number] = target;
global.musicdata[target, musicdata.path] = a_winterWalk;
global.musicdata[target, musicdata.musicname] = "Winter Walk";
global.musicdata[target, musicdata.creatorname] = "Podington Bear";
global.musicdata[target, musicdata.length] = audio_sound_length(a_winterWalk)*FPS_DEFAULT;
global.musicdata[target, musicdata.earlystop] = 180;


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
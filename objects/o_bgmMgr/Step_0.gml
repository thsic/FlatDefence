if(!fade_mode){
	if(global.nowmusic_number != -1){
		//ゲームで実際に再生する時間 (無音の時間対策)
		var music_play_time = global.musicdata[global.nowmusic_number, musicdata.length]-global.musicdata[global.nowmusic_number, musicdata.earlystop]
		if(global.nowmusic_time < music_play_time){
			if(global.double_speed){//2倍速にすると増えるスピードを半減
				global.nowmusic_time += 0.5;
			}
			else{
				global.nowmusic_time++;
			}
		
		}
		else{//曲が終わった
			audio_stop_sound(global.nowmusic_number);
			global.nowmusic_number = -1;
		}
	}



	//再生中の曲が無いので再生
	if(global.nowmusic_number = -1){
		//次の曲を再生して、その次の曲を決める
		play_music(global.nextmusic_number);
		global.nextmusic_number = select_music_random();
	}
}

if(instance_exists(o_gameMgr)){
	switch(global.gamestate){
	case gamestate.gameover:
		//ゲームオーバーになると60fかけてbgmがフェードアウトしていく
		if(music_fade_out_frame = -1){
			fade_mode = true//フェードモード
			music_fade_out_frame = 60
			var nowmusic_path = global.musicdata[global.nowmusic_number, musicdata.path];
			audio_sound_gain(nowmusic_path, 0, 1000);
			nowmusic_volume = audio_sound_get_gain(nowmusic_path)
		}
		else{
			if(music_fade_out_frame > 0){
				music_fade_out_frame--;
				global.nowmusic_time++;//フェードアウト中もタイムは経過する
			}
			else{
				audio_pause_sound(global.nowmusic_number);
				music_pause = true
			}
		}
	break
	
	//ゲームオーバー画面が終わると曲が再生
	case gamestate.main:
	case gamestate.rest:
	case gamestate.pause:
	case gamestate.restpause:
		if(music_pause){
			if(music_fade_in_frame = -1){
				var nowmusic_path = global.musicdata[global.nowmusic_number, musicdata.path];
				var nowmusic_number = global.nowmusic_number;
				audio_resume_sound(nowmusic_path);
				
				audio_sound_gain(nowmusic_path, global.musicdata[nowmusic_number, musicdata.volume]*global.bgm_volume, 1500);
				music_fade_in_frame = 90
			}
			else{
				if(music_fade_in_frame > 0){
					music_fade_in_frame--;
					global.nowmusic_time++;//フェードイン中もタイムは経過
				}
				else{
					music_fade_in_frame = -1;
					music_fade_out_frame = -1
					fade_mode = false;
					music_pause = false
				}
			}
		}
	break
	}
}

//ステージセレクトに飛んだ場合 上と全く同じ
if(fade_mode and room = r_stageSelect){
	if(music_pause){
		if(music_fade_in_frame = -1){
			var nowmusic_path = global.musicdata[global.nowmusic_number, musicdata.path];
			var nowmusic_number = global.nowmusic_number;
			audio_resume_sound(nowmusic_path);
			audio_sound_gain(nowmusic_path, global.musicdata[nowmusic_number, musicdata.volume]*global.bgm_volume, 1500);
			music_fade_in_frame = 90
		}
		else{
			if(music_fade_in_frame > 0){
				music_fade_in_frame--;
				global.nowmusic_time++;
			}
			else{
				music_fade_in_frame = -1;
				music_fade_out_frame = -1
				fade_mode = false;
				music_pause = false
			}
		}
	}
}
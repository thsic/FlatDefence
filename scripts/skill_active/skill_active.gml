//スキル使用中

skill_active_time--;
if(skill_active_time <= 0){//スキル効果時間切れ
	skill_cooldown = global.skilldata[skill_id, skilldata.cooldown];
	skill_state = skillstate.cooldown;
}

//スキル効果
switch(global.skilldata[skill_id, skilldata.magnification_type]){
case defender_status.damage:
	fire_damage *= global.skilldata[skill_id, skilldata.magnification];
break
case defender_status.attack_speed:
	attack_speed *= global.skilldata[skill_id, skilldata.magnification];
break
case defender_status.range:
	range *= global.skilldata[skill_id, skilldata.magnification];
break
case other:
	
break
}

//追加効果
if(global.skilldata[skill_id, skilldata.effect] != -1){
	
}
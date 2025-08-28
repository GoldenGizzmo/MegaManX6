// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_voicelines(voiceline)
{
	switch (voiceline)
	{
		case "Jump":
			var chance = irandom(1); //Chance to happen
			if chance = 0
				scr_make_sound(choose(snd_player_x_talk_jump,snd_player_x_talk_jump_2,snd_player_x_talk_jump_3),1,1,false);
			break;
		
		case "Hurt": scr_make_sound(choose(snd_player_x_talk_hurt,snd_player_x_talk_hurt_2),1,1,false); break;
		case "Death": scr_make_sound(snd_player_x_talk_death,1,1,false); break;
		case "Low Health": scr_make_sound(snd_player_x_talk_lowhealth,1,1,false); break;
		case "Wall Jump": scr_make_sound(snd_player_x_talk_walljump,1,1,false); break;
		
		case "Charge Shot":
			var chance = irandom(2); //Chance to happen
			if chance = 0
				scr_make_sound(choose(snd_player_x_talk_chargeshot,snd_player_x_talk_chargeshot_2,snd_player_x_talk_chargeshot_3),1,1,false);
			break;
			
		case "Weapon":
			var chance = irandom(2); //Chance to happen
			if chance = 0
				scr_make_sound(choose(snd_player_x_talk_weapon,snd_player_x_talk_weapon_2),1,1,false);
			break;
	}
}
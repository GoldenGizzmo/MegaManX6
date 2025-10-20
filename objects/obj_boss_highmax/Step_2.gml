/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Stop High Max from killing the player in the intro
if stop_death = true
{
	if global.life <= 0
	{
		global.life = 1;
		
		//Continue hurt event like normal
		with obj_player
		{
			alarm[3] = 30; //Recovery time
			recovery_time = base_recovery_time;
			
			scr_make_sound(snd_explosion_bullet,1,1,false);
			scr_player_voicelines("Hurt");
		}
	}
}
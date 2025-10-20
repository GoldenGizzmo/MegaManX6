/// @description Choose Attack

if life > 0
{
	event_user(3);
	xspeed = 0;
	if room = rm_intro //Can't be killed by High Max
		stop_death = true;
	
	//Choose attack
	switch (state)
	{
		case "Shooting": 
			state = choose("Punching","Overcharge","Death Ball",); 
			break;
		case "Death Ball":
			state = choose("Punching","Overcharge","Shooting",); 
			break;
		
		case "Punching": 
		case "Overcharge": 
			state = choose("Shooting","Death Ball"); 
			break;
		
		default: state = "Shooting"; break;
	}
	alarm[0] = 30;
	
	//Trigger fight end cutscene
	if global.life = 1
	{
		state = "Stop";
		alarm[0] = -1;
	
		if !instance_exists(obj_cutscene_intro_ending)
		{
			scr_make_sound(snd_highmax_talk_muda,1,1,false);
			instance_create_depth(0,0,0,obj_cutscene_intro_ending);
		}
	}
}
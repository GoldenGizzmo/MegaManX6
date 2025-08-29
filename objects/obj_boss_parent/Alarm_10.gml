/// @description Boss Exploding

switch (action)
{
	case 0: //Start flickering faster
		action++;
		alarm[10] = 60*1;
	
		boss_flicker_speed = 4;
		break;

	case 1: //Intial explosion
		action++;
		alarm[10] = 60*2;
		alarm[11] = 10;
		
		//Stop music
		audio_stop_sound(global.music);
		global.music = "Off";
		
		instance_create_layer(x,y,"Explosions",obj_explosion);
		scr_make_sound(snd_explosion_boss,1,1,false);
		exploding = 1;
		break;
		
	case 2:	//Start fading out
		action++;
		alarm[10] = 1;
	
		fade_out = instance_create_depth(0,0,0,obj_fade_out);
		fade_out.fade_speed = 0.005;
		//fade_out.fade_type = 1;
		fade_out.image_blend = c_white;
		break;
		
	case 3: //Check if fully faded to white
		if fade_out.alpha >= 1
		{
			//Complete explosion
			action++;
			alarm[10] = 60;
			
			exploding = 0;
			image_alpha = 0;
			boss_iframes = 0;
			boss_flicker = false;
			
			scr_make_sound(snd_explosion_boss_final,1,1,false);
			
			with obj_bossmanager
				bossfight_state = 9;
		}
		else
			alarm[10] = 1;
		break;
		
	case 4: //Start fading in
		instance_destroy(fade_out);
		fade_in = instance_create_depth(0,0,0,obj_fade_in);
		fade_in.fade_speed = 0.0075;
		//fade_in.fade_type = 1;
		fade_in.image_blend = c_white;
		
		soul = instance_create_layer(x,y,"Projectiles",obj_pickup);
		soul.sprite_index = spr_pickup_soul_large;
		
		instance_create_depth(0,0,0,obj_results);
		instance_destroy();
		break;
}
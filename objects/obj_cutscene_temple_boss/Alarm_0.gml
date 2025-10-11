/// @description Insert description here
// You can write your code in this editor

switch (action)
{
	case 0:
		if !instance_exists(obj_dialogue)
		{
			action++;
			alarm[0] = 90;
		}
		else
			alarm[0] = 1;
		break;
		
		
	case 1:
		action++;
		alarm[0] = 1;
		
		with obj_boss_turtloid
		{
			image_index = 0;
			sprite_index = spr_boss_turtloid_shame;
			animation_ended = false;
		}
		
		audio_stop_sound(global.music);
		global.music = noone;
		
		scr_make_sound(snd_turtloid_spin,1,1,false);
		break;
		
	case 2:
		if obj_boss_turtloid.animation_ended = true
		{
			with obj_boss_turtloid
			{
				image_index = -1;
				image_speed = 0;
				animation_ended = false;
			}
			
			action++;
			alarm[0] = 180;
		}
		else
			alarm[0] = 1;
		break;
		
	case 3:
		conversation = instance_create_depth(0,0,0,obj_dialogue);
		conversation.dialogue = "X vs Turtloid 2";
		
		with obj_bossmanager
			alarm[0] = 1;
		break;
}
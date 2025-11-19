/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case 0: //Activating pad
	
		//Player has to be ontop and near the middle
		//Needs to be less than full health
		if place_meeting(x,y-1,obj_player) and obj_player.airborne = false and (x > obj_player.x-10 and x < obj_player.x+10) and global.life < global.lifemax
		{
			state++;
			alarm[0] = 1;
			
			//Lock the player into the middle of the capsule
			obj_player.x = x;
			obj_player.y = y+4;
			obj_player.xspeed = 0;
			obj_player.movement = false;
			obj_player.animation_lock = true;
			obj_player.sprite_index = spr_port_x_idle;
			
			//Draw upgrading effect
			effect = instance_create_layer(x,y,"Explosions",obj_capsule_effect);
			effect.sprite_index = spr_healingpad_wall;
			effect.blendmode = true;

			scr_make_sound(snd_healing_pad,1,1,false);
		}
		break;
		
	case 2: //If fully healed
		if global.pause_healing = 0
		{
			state++;
			effect.sprite_index = spr_healingpad_energy_end;
		}
		else
		{
			effect.sprite_index = spr_healingpad_energy
			effect.image_index = healing_animation/2;
		}
		break;
		
	case 3: //Play the finishing effect
		if healing_animation%2 = 0
		{
			if wall_animation < 11
			{
				wall_animation++;
				effect.image_index = wall_animation;
			}
			else
			{
				state++;
			
				wall_animation = 0;
				pad_animation = 0;
			
				instance_destroy(effect);
				image_index = 0;
			
				with obj_player
				{
					movement = true;
					animation_lock = false;
				}
			}
		}
		break;
		
	case 4:
		if !place_meeting(x,y-1,obj_player)
			state = 0;
		break;
}

//Animating
if state > 0 and state < 4
{
	pad_animation++;
	if pad_animation%2 = 0
		image_index++;
}

if state > 1
	healing_animation++;
	

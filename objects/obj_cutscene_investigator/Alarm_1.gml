/// @description Boss Animation

var scale = global.ui_scale/1.25; //Menu size

switch (obj_menu_paused.menu_position)
{
	case 0: //Yammark
		switch (action_boss)
		{
			case 0: //Charge
				action_boss++;
				alarm[1] = 30;
			
				sprite_index = spr_boss_yammark_charge;
				break;
				
			case 1: //Spawn yanma
				action_boss++;
				alarm[1] = 90;
			
				sprite_index = spr_boss_yammark_charge_release;
				animation_ended = false;
				
				//Removes existing
				for (var a = 0; a < 3; a++)
				{
					spawn = instance_create_depth(0,0,depth-1,obj_actor_yanma_option);
					spawn.orbit_angle = 45+((360/3)*a);
					spawn.orbit = 0;
					spawn.orbit_speed = 3;
					spawn.orbit_grow = 35*scale;
					
					spawn.center_x = display_get_gui_width()/2;
					spawn.center_y = display_get_gui_height()/2-(10*scale);
					spawn.image_xscale = scale;
					spawn.image_yscale = scale;
				}

				effect = instance_create_layer(display_get_gui_width()/2,display_get_gui_height()/2-(10*scale),"Explosions",obj_particle_gui);
				effect.sprite_index = spr_effect_reinforcement;
				effect.image_xscale = scale;
				effect.image_yscale = scale;
				break;
				
			case 2:
				if animation_ended = true
				{
					animation_ended = false;
					
					action++;
					alarm[0] = 1;
					
					action_boss++;
					alarm[1] = 1;
				}
				else
					alarm[1] = 1;
				break;
				
			case 3:
				sprite_index = spr_boss_yammark_attack;
				break;
		}
		break;
		
	case 1: //Turtloid
		switch (action_boss)
		{
			case 0: //Set up attack
				action_boss++;
				alarm[1] = 1;

				animation_ended = false;
				sprite_index = spr_boss_turtloid_stomp;
				image_index = 0;
				break;
			
			case 1: //Spawn projectile
				alarm[1] = 1;
				if image_index > 5
				{
					action_boss++;
					alarm[1] = 1;
						
					action++;
					alarm[0] = 1;
					
				}
				break;
				
			case 2:
				sprite_index = spr_boss_turtloid_complete;
				break;
		}
		break;	
	



}
/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (state)
	{
		case "Roaming":
			xspeed = 0.5*image_xscale;
			break;
		
		case "Attacking":
			switch (action)
			{
				case 0: //Sprint towards the player
					alarm[0] = 1;	
			
					event_user(3);
					xspeed = 3*image_xscale;
					if xspeed > 0
						image_speed = xspeed;
					else
						image_speed = -xspeed;
					
					var spot_distance = 80;
					if obj_player.y < y+50 and obj_player.y > y-50
					{
						//If close enough
						if (obj_player.x < x+spot_distance and image_xscale = 1) or (obj_player.x > x-spot_distance and image_xscale = -1)
						{
							action++;
							alarm[0] = 10;
					
							alarm[1] = -1;
							image_speed = 0;
							xspeed = 0;
						
						}	
					}
					break;
				
				case 1: //Start to lunge
					alarm[0] = 1;
					action++;
				
					image_speed = 1;
					image_index = 0;
					sprite_index = spr_enemy_grasshopper_swipe_alt;
					animation_ended = false;
					break;
					
				case 2: //Burst of speed
					if image_index > 3
					{
						xspeed = 6*image_xscale;
						scr_make_sound(snd_grasshopper_swipe,1,1,false);
					
						action++;
						alarm[0] = 1;
					}
					else
						alarm[0] = 1;
					break;
				
				case 3:
					alarm[0] = 1;
				
					if global.animate%3 = 0
					{
						afterimage = instance_create_depth(x,y,depth+10,obj_afterimage);
						afterimage.sprite_index = sprite_index;
						afterimage.image_xscale = image_xscale;
						afterimage.image_blend = make_color_rgb(178,102,0);
					}
				
					//Once the animation ends, start slowing down
					if animation_ended = true
					{
						animation_ended = false;
						image_index = -1;
						image_speed = 0;
					
						if xspeed > 0
							xspeed -= 0.2;
						else if xspeed < 0
							xspeed += 0.2;
						else
						{
							action++;
							alarm[0] = 30;
						
							jet_anim_speed = 1;
						}
					}
					else	
						jet_anim_speed = 3;
					break;
				
				case 4:
					state = "Roaming";
					alarm[0] = 1;
				
					action = 0;
					break;
			}
			break;
	}
}
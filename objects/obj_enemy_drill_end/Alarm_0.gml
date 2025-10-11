/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (action)
	{
		case 0: //Spin
			action++;
			alarm[0] = 30;
		
			image_speed = 1;
			sprite_index = spr_enemy_drill_spin;			
			
			scr_make_sound(snd_drill,1,1,false);
			break;
			
		case 1: //Drop drill
			action++;
			alarm[0] = 5;
			
			weight = 0.5;
			colliding = true;
			yspeed = 1;
			
			scr_make_sound(snd_monbando_shoot,1,1,false);
			break;

		case 2: //Hitting something
			if airborne = false or y > ystart+100
			{
				action++;
				alarm[0] = 1;
				
				shoot = 1;
				shoot_amount = 20;
				
				scr_make_sound(snd_fish_bite,1,0.5,false);
				
				if airborne = false
					hit_ground = true;
				else
					hit_ground = false;
				
				//Bounce effect
				y -= 1;
				alarm[1] = 5;
				
				weight = 0;
				yspeed = 0;
			}
			else
				alarm[0] = 1;
			break;
			
		case 3:	//Drill to create rubble projectiles
			if shoot < shoot_amount
			{
				shoot++;
				alarm[0] = 5;
				
				if hit_ground = true
				{
					event_user(11); //Rubble
					if shoot%4 = 0 //Bullet
						event_user(10);
					if shoot%2 = 0 //SFX
						scr_make_sound(snd_drill,0.5,1,false);
			
					shake = instance_create_depth(0,0,0,obj_shake);
					shake.length = 10;
					shake.intensity = 1;
				}
			}
			else
			{
				action++;
				alarm[0] = 60;
				
				image_speed = 0.5;
				hit_ground = false;
			}
			break;
			
		case 4: //Retract the drill
			image_speed = 0;
		
			if y > ystart
			{
				yspeed = -1;
				alarm[0] = 1;
			}
			else
			{
				//Reset everything and reduce the aggro range
				shoot = 0;
				action = 0;
				with owner
				{
					alarm[0] = 1;
					action = 0;
					
					image_speed = -1;
					aggro_range = 5;
					
					event_user(3);
				}

				yspeed = 0;
				y = ystart;
			}
			break;
	}
}
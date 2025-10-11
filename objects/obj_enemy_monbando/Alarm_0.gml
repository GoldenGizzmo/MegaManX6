/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (state)
	{
		case "Blocking": //Choose next attack
			alarm[0] = 1;
			if distance_to_object(obj_player) < aggro_range
			{
				state = choose("Slam","Punch");
				image_speed = 1;
			}		
			break;
			
		case "Slam":
			switch (action)
			{
				case 0: //Set up attack
					action++;
					alarm[0] = 1;
	
					event_user(3);

					animation_ended = false;
					sprite_index = spr_enemy_monbando_slam;
					image_index = 0;
					break;
			
				case 1: //Spawn projectile
					if image_index > 6
					{
						event_user(10);
	
						action++;
						alarm[0] = 1;
					}
					else
						alarm[0] = 1;
					break;
					
				case 2: //Finish animation
					if animation_ended = true
					{
						animation_ended = false;
						
						action = 0;
						shoot = 0;
						state = "Blocking";
						alarm[0] = 120;
						
						sprite_index = spr_enemy_monbando;
						image_index = 0;
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
			
		case "Punch":
			switch (action)
			{
				case 0: //Set up attack
					action++;
					alarm[0] = 1;
	
					event_user(3);

					animation_ended = false;
					sprite_index = spr_enemy_monbando_punch;
					image_index = 0;
					break;
			
				case 1: //Spawn projectile
					if image_index > 4
					{
						event_user(11);
	
						action++;
						alarm[0] = 1;
					}
					else
						alarm[0] = 1;
					break;
					
				case 2:
					alarm[0] = 1;
					if image_index > 6
					{
						image_speed = 0;
						
						var check = false;
						var my_arm = id;
						with obj_bullet_monbando
							if owner = my_arm
								check = true;
					
						if check = false
						{
							action++;
							alarm[0] = 1;
						
							image_speed = 1;
						}
					}
					break;
					
				case 3: //Finish animation
					if animation_ended = true
					{
						animation_ended = false;
						
						action = 0;
						shoot = 0;
						state = "Blocking";
						alarm[0] = 120;
						
						sprite_index = spr_enemy_monbando;
						image_index = 0;
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
			
		case "Stunned":
			switch (action)
			{
				case 0: //Set up attack
					action++;
					alarm[0] = 1;
					
					flickering = 1;
					scr_make_sound(snd_monbando_slam,1,2,false);
					
					shake = instance_create_depth(0,0,0,obj_shake);

					animation_ended = false;
					image_speed = 1;
					sprite_index = spr_enemy_monbando_stun;
					image_index = 0;
					break;
			
				case 1:
					if image_index > 3
					{
						image_speed = 0;
						flickering = 0;
	
						action++;
						alarm[0] = 30;
					}
					else
						alarm[0] = 1;
					break;
					
				case 2:
					action++;
					alarm[0] = 1;
				
					image_speed = 1;
					break;
					
				case 3: //Finish animation
					if animation_ended = true
					{
						animation_ended = false;
						
						action = 0;
						shoot = 0;
						state = "Blocking";
						alarm[0] = 60;
						
						sprite_index = spr_enemy_monbando;
						image_index = 0;
					}
					else
						alarm[0] = 1;
					break;
			}
			break;
	}
}
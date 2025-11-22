/// @description Insert description here
// You can write your code in this editor

switch (action)
{
	case 0: //Begin when player can move
		if obj_player.movement = true
		{
			action++
			alarm[0] = 60;
			
			//Skip to 2nd section
			if ridechaser_type = 1
				action = 111;
				
				//action = 21;
		}
		else
			alarm[0] = 1;
		break;

	//Spawn section 1 (Spiky, Nightmares, Nightmare Smalls)
	case 1:
		action++;
		alarm[0] = ridechaser_delay*3;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,0);
		break;
	case 2:
		action++;
		alarm[0] = ridechaser_delay*3;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,6);
		break;
	case 3:
		action++;
		alarm[0] = ridechaser_delay*5;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,6);
		
		scr_ridechaser_spawn(obj_enemy_nightmare_small,10,-4,0);
		scr_ridechaser_spawn(obj_enemy_nightmare_small,11,-3,0);
		scr_ridechaser_spawn(obj_enemy_nightmare_small,11,-4,0);
		scr_ridechaser_spawn(obj_enemy_nightmare,10,-5,0);
		break;
	case 4:
		action++;
		alarm[0] = ridechaser_delay*3;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,0);
		break;
	case 5:
		action++;
		alarm[0] = ridechaser_delay*2;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,0);
		
		scr_ridechaser_spawn(obj_enemy_nightmare,8,-3,0);
		break;
	case 6:
		action++;
		alarm[0] = ridechaser_delay*3;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,0);
		break;
	case 7:
		action++;
		alarm[0] = ridechaser_delay*3;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,6);
		break;
	case 8:
		action++;
		alarm[0] = ridechaser_delay*5;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,6);
		
		scr_ridechaser_spawn(obj_enemy_nightmare_small,11,-4,0);
		scr_ridechaser_spawn(obj_enemy_nightmare_small,10,-3,0);
		scr_ridechaser_spawn(obj_enemy_nightmare_small,9,-4,0);
		scr_ridechaser_spawn(obj_enemy_nightmare,10,-3,0);
		break;
	case 9:
		action++;
		alarm[0] = ridechaser_delay*3;
		
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,0);
		break;
	case 10:
		action++;
		alarm[0] = ridechaser_delay*5;
		
		scr_ridechaser_spawn(obj_enemy_nightmare,6,2,0);
		scr_ridechaser_spawn(obj_enemy_nightmare_small,6,1,0);
		scr_ridechaser_spawn(obj_enemy_nightmare_small,7,2,0);
		
		ridechaser_break = true;
		break;
		
	//Spawn section 2 (Spiky, Probes)
	case 11:
		action++;
		alarm[0] = ridechaser_delay*3;
		ridechaser_break = false;
		
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,0);
		
		scr_ridechaser_spawn(obj_enemy_probe,15,-4,0);
		break;
	case 12:
		action++;
		alarm[0] = ridechaser_delay*3;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,8);
		break;
	case 13:
		action++;
		alarm[0] = ridechaser_delay*5;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,4);
		break;
	case 14:
		action++;
		alarm[0] = ridechaser_delay*5;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,0);
		
		scr_ridechaser_spawn(obj_enemy_probe,15,0,0);
		scr_ridechaser_spawn(obj_enemy_probe,15,-3,0);
		break;
	case 15:
		action++;
		alarm[0] = ridechaser_delay*2;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,5);
		break;
	case 16:
		action++;
		alarm[0] = ridechaser_delay*5;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,5);
		
		scr_ridechaser_spawn(obj_enemy_probe,-15,-5,0);
		break;
	case 17:
		action++;
		alarm[0] = ridechaser_delay*3;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,0);
		break;
	case 18:
		action++;
		alarm[0] = ridechaser_delay*3;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,0);
		
		scr_ridechaser_spawn(obj_enemy_probe,15,-5,0);
		break;
	case 19:
		action++;
		alarm[0] = ridechaser_delay*3;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,0);
		break;
	case 20:
		action++;
		alarm[0] = ridechaser_delay*10;
		scr_ridechaser_spawn(obj_enemy_spiky,17,0,6);
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,3);
		
		ridechaser_break = true;
		break;
		
	case 21:
		action++;
		instance_create_layer(0,0,"Instances",obj_enemy_heatnix);
		break;
		
		
		
	//Spawn section 1 (Spiky, Nightmares, Nightmare Smalls, Nightmare Blazes)
	case 101:
		action++;
		alarm[0] = ridechaser_delay*3;
		scr_ridechaser_spawn(obj_enemy_spiky,17,0,6);
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,3);
		break;
	case 102:
		action++;
		alarm[0] = ridechaser_delay*3;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,0);
		break;
	case 103:
		action++;
		alarm[0] = ridechaser_delay*1;

		scr_ridechaser_spawn(obj_enemy_nightmare_blaze,10,-2,0);
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,3);
		break;
	case 104:
		action++;
		alarm[0] = ridechaser_delay*3;
		scr_ridechaser_spawn(obj_enemy_spiky,17,0,6);
		break;
	case 105:
		action++;
		alarm[0] = ridechaser_delay*4;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,0);
		break;
	case 106:
		action++;
		alarm[0] = ridechaser_delay*2;
		
		scr_ridechaser_spawn(obj_enemy_nightmare_small,11,-4,0);
		scr_ridechaser_spawn(obj_enemy_nightmare_small,10,-3,0);
		scr_ridechaser_spawn(obj_enemy_nightmare_small,9,-4,0);
		scr_ridechaser_spawn(obj_enemy_nightmare_blaze,11,-2,0);
		break;
	case 107:
		action++;
		alarm[0] = ridechaser_delay*3;
		
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,0);
		break;
	case 108:
		action++;
		alarm[0] = ridechaser_delay*5;
		
		scr_ridechaser_spawn(obj_enemy_nightmare_small,7,2,0);
		scr_ridechaser_spawn(obj_enemy_nightmare_small,6,1,0);
		break;
	case 109:
		action++;
		alarm[0] = ridechaser_delay*3;
		
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,5);
		break;
	case 110:
		action++;
		alarm[0] = ridechaser_delay*5;
		
		scr_ridechaser_spawn(obj_enemy_nightmare,10,-3,0);
		scr_ridechaser_spawn(obj_enemy_nightmare,6,2,0);
		scr_ridechaser_spawn(obj_enemy_nightmare_small,7,2,0);
		
		ridechaser_break = true;
		break;
		
	//Spawn section 2 (Spiky, Probes)
	case 111:
		action++;
		alarm[0] = ridechaser_delay*3;
		ridechaser_break = false;
		
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,0);
		
		scr_ridechaser_spawn(obj_enemy_probe,15,-4,0);
		break;
	case 112:
		action++;
		alarm[0] = ridechaser_delay*3;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,8);
		
		break;
	case 113:
		action++;
		alarm[0] = ridechaser_delay*5;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,4);
		break;
	case 114:
		action++;
		alarm[0] = ridechaser_delay*5;
		
		scr_ridechaser_spawn(obj_enemy_probe,14,0,0);
		scr_ridechaser_spawn(obj_enemy_probe,14,-3,0);
		scr_ridechaser_spawn(obj_enemy_probe,14,-6,0);
		break;
	case 115:
		action++;
		alarm[0] = ridechaser_delay*2;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,5);
		
		break;
	case 116:
		action++;
		alarm[0] = ridechaser_delay*5;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,5);
		
		scr_ridechaser_spawn(obj_enemy_nightmare_blaze,-10,-3,0);
		break;
	case 117:
		action++;
		alarm[0] = ridechaser_delay*3;
		
		scr_ridechaser_spawn(obj_enemy_nightmare_small,8,2,0);
		scr_ridechaser_spawn(obj_enemy_nightmare_small,7,4,0);
		scr_ridechaser_spawn(obj_enemy_nightmare_small,10,3,0);
		break;
	case 118:
		action++;
		alarm[0] = ridechaser_delay*3;
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,0);
		
		scr_ridechaser_spawn(obj_enemy_probe,15,-5,0);
		break;
	case 119:
		action++;
		alarm[0] = ridechaser_delay*5;
		scr_ridechaser_spawn(obj_enemy_nightmare,8,-3,0);
		scr_ridechaser_spawn(obj_enemy_nightmare_small,9,3,0);
		scr_ridechaser_spawn(obj_enemy_nightmare_small,7,4,0);
		break;
	case 120:
		action++;
		alarm[0] = ridechaser_delay*10;
		scr_ridechaser_spawn(obj_enemy_nightmare_blaze,11,-2,0);
		
		scr_ridechaser_spawn(obj_enemy_spiky,17,0,6);
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,3);
		
		ridechaser_break = true;
		break;
		
	case 121: //Fire comes back
		action++;
		alarm[0] = 1;
	
		fire = instance_create_layer(obj_camera.x-250,obj_camera.y-300,"Explosions",obj_fire);
		fire.side = true;
		fire.image_xscale = 15;
		fire.image_yscale = 15;
		fire.image_angle = 270;
		
		shake = instance_create_depth(0,0,0,obj_shake);
		shake.intensity = 2;
		shake.length = 99999;
		shake.style = 1;
		
		with obj_boss_donut_purple
		{
			x = obj_camera.x-300;
			y = obj_camera.y;
		}
		
		scr_make_sound(snd_heatnix_rumble,1,1,true);
		break;
		
	case 122: //Move moves up and stops	
		if fire.x > obj_camera.x-160
		{
			action++;
			alarm[0] = 30;
		
			instance_destroy(shake);
			audio_stop_sound(snd_heatnix_rumble)
		}
		else
		{
			alarm[0] = 1;
			fire.x += 0.5;
		}
		break;
	
	case 123:
		if obj_player.x > obj_camera.x-50 and obj_player.airborne = false
		{
			with obj_player
			{
				xspeed = 0;
				movement = false;
			}
			
			with inst_1B9D976D
			{
				x = obj_player.x;
				y = obj_player.y;
			
				bossfight_state = 4;
				alarm[0] = 1;
			}
			
			action++;
		}
		else
			alarm[0] = 1;
		break;
		
	
}
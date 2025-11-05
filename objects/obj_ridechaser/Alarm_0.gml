/// @description Insert description here
// You can write your code in this editor

switch (action)
{
	case 0: //Begin when player can move
		if obj_player.movement = true
		{
			action++; //22
			alarm[0] = 60;
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
		alarm[0] = ridechaser_delay*3;
		
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
		alarm[0] = ridechaser_delay*5;
		scr_ridechaser_spawn(obj_enemy_spiky,17,0,6);
		scr_ridechaser_spawn(obj_enemy_spiky,15,0,3);
		break;
		
	case 21:
		action++;
		alarm[0] = 120;
		
		ridechaser_break = true;
		break;
		
	case 22:
		action++;
		instance_create_layer(0,0,"Instances",obj_enemy_heatnix);
		break;
}
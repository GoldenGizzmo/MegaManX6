/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case 0: //Big line
		streak = instance_create_depth(0,0,0,obj_ready_streak);
		streak.draw_y = display_get_gui_height()/2-(5*global.ui_scale);
		
		streak.width = 400;
		streak.height = 5;
		
		streak.draw_x = -streak.width*global.ui_scale;
		
		state++;
		alarm[0] = 15;
		break;
		
	case 1: //Start the READY
		state++;
		alarm[0] = 1;
		break;
	
	case 2:	//Ready appears and animates
		if ready_animate < 4
		{
			ready_animate++;
			alarm[0] = 2; //animation speed
		}
		else
		{
			state++;
			alarm[0] = 30
		}
		break

	case 3:	//Move diagonally upwards to make a shadow
		if ready_elivate < 5
		{
			ready_elivate++;
			alarm[0] = 1; //animation speed
			
			draw_x -= 1*global.ui_scale;
			draw_y -= 1*global.ui_scale;
		}
		else
		{
			state++;
			alarm[0] = 60;
			
			scr_make_sound(snd_ready,1,1,false);
		}
		break;
		
	case 4:	//Move diagonally back downwards
		if ready_elivate > 0 
		{
			ready_elivate--;
			alarm[0] = 1; //animation speed
			
			draw_x += 1*global.ui_scale;
			draw_y += 1*global.ui_scale;
			
			
		}
		else
		{
			state++;
			alarm[0] = 1;
		}
		break;
		
	case 5: //Move offscreen in two parts
		state++;
		alarm[0] = 120;
		break;
		
	case 6:
		instance_destroy();
		break;
}
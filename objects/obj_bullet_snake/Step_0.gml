/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if pursue > 0
{
	if state = 0 //Choosing direction
	{		
		//Alternate axis
		if moving_vertical = true 
		{
			moving_vertical = false;
					
			if obj_player.x < x
				direction = 180;
			else
				direction = 0;
				
		}
		else
		{
			moving_vertical = true; 
					
			if obj_player.y > y
				direction = 270;
			else
				direction = 90;
		}
	
		move_delay = 30;
		pursue--;
		state++
	}
	else
	{
		//Move to player's axis and then turn after a delay
		if move_delay > 0
			move_delay--;
				
		switch (direction)
		{
			case 0: //Moving right
				if (obj_player.x < x and move_delay = 0)
					state = 0;
				break; 
			case 90:  //Moving up
				if (obj_player.y > y and move_delay = 0)
					state = 0;
				break; 
			case 180: //Moving left
				if (obj_player.x > x and move_delay = 0)
					state = 0;
				break; 
			case 270: 
				if (obj_player.y-20 < y and move_delay = 0)
					state = 0;
				break; 
		}
	}
}
else
	phasing = false;

if global.animate%4 = 0
{
	afterimage = instance_create_depth(x,y,depth+10,obj_afterimage);
	//afterimage.image_blend = choose(c_blue,c_red);
	afterimage.sprite_index = sprite_index;
	afterimage.image_index = irandom(4);
	afterimage.image_xscale = image_xscale;
	afterimage.image_alpha = 2;
	afterimage.blank = false;
	afterimage.blendmode = bm_normal;
}
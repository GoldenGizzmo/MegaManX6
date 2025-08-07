/// @description Insert description here
// You can write your code in this editor

image_xscale = 360/sprite_get_width(sprite_index);
image_yscale = 240/sprite_get_height(sprite_index);

var check = false;
with obj_player
	if place_meeting(x,y,obj_pit)
		check = true;
	
if instance_exists(obj_camera_freemove)
{
	var find_space = 0;
	var find_transition_x = 0;
	var find_transition_y = 0;
	with obj_player
	{
		find_space = instance_place(x,y,obj_camera_freemove);
		if find_space = noone
		{
			//Not in a bossfight
			var check = false;
			with obj_bossmanager
				if bossfight_begin = true
					check = true;		
			if check = false
				find_space = camera_lasttouch;	
		}
		
		find_transition_x = instance_place(x,y,obj_camera_horizontal);
		find_transition_y = instance_place(x,y,obj_camera_vertical);
	}

	if find_space != noone
	{	
		//Camera is clamped in the width of this object
		var length_x = 16*find_space.image_xscale;
		if find_transition_x = noone //If not touching horizontal transitional object
			x = clamp(obj_player.x,find_space.x+global.view_width/2,find_space.x+length_x-global.view_width/2);
		else
			x = obj_player.x;
		
		//Camera is clamped in the height of this object
		var length_y = 16*find_space.image_yscale;
		var border = 25; //Border which causes the screen to scroll vertically
		var scroll_speed = obj_player.yspeed;
		if scroll_speed < 0 //Stay a positive number
			scroll_speed *= -1;
			
		//System that stops aggressive scrolling (mostly from small actions to make it less disorientating)
		if obj_player.y < y-border 
			y -= scroll_speed;
		else if obj_player.y > y+border
			y += scroll_speed;
		
		if find_transition_y = noone //If not touching vertical transitional object
		{
			
			
			//Stay within the camera boundaries
			y = clamp(y,find_space.y+global.view_height/2,find_space.y+length_y-global.view_height/2);
		}
		else
			y = obj_player.y;
	}
	else
	{
		
	}

	var find_boss = 0;
	with obj_player
		find_boss = instance_place(x,y,obj_camera_bossroom);
	with find_boss
		if active = false
			find_boss = noone
		
	if find_boss != noone
	{
		x = find_boss.x;
		y = find_boss.y;
	}
}
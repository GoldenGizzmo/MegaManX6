/// @description Insert description here
// You can write your code in this editor

image_xscale = 560/sprite_get_width(sprite_index);
image_yscale = 440/sprite_get_height(sprite_index);

if instance_exists(obj_player)
{
	if distance_to_object(obj_player) > 5
	{
		x = obj_camera.x+shake_x;
		y = obj_camera.y+shake_y;
	}
	else
	{
		var yspeed = 0.2;
		with obj_player	
			if place_meeting(x,y,obj_camera_horizontal_smooth)
				yspeed = 0.05;
		
		x += (obj_camera.x - x)*0.2+shake_x;
		y += (obj_camera.y - y)*yspeed+shake_y;
	}
}
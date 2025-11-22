/// @description Insert description here
// You can write your code in this editor

if flee = false
{
	direction = point_direction(x,y,obj_boss_donut.x,obj_boss_donut.y);
	speed = 6;
	if obj_boss_donut.x > x
		image_xscale = 1;
	else
		image_xscale = -1;
	
	if distance_to_point(obj_boss_donut.x,obj_boss_donut.y) < 6
	{
		speed = 0;
		if image_alpha > 0
			image_alpha -= 0.1;
		else
			instance_destroy();
	}
	else
	{
		if image_alpha < 1
			image_alpha += 0.05;

	}
}
else
{
	image_alpha = 1;
	if flee_delay = 0
	{
		if speed < 6
			speed += 0.1;
	}
	else
	{
		flee_delay--;
		speed = 0.2;
	}
	
	image_xscale = 1;
	if direction > 90 and direction < 270
		image_xscale = -1;
}

//Afterimages
if global.animate%10 = 0
{
	offset_x = 0;
	offset_y = 0;
		
	var offset_chance = irandom(3);
	var offset_range = 4;
	if offset_chance = 0
	{
		offset_x = random_range(-offset_range,offset_range);
		offset_y = random_range(-offset_range,offset_range);
	}
		
	afterimage = instance_create_depth(x+offset_x,y+offset_y,depth+10,obj_afterimage);
	afterimage.image_blend = choose(c_blue,c_red);
	afterimage.sprite_index = sprite_index;
	afterimage.image_index = image_index;
	afterimage.image_xscale = image_xscale;
}
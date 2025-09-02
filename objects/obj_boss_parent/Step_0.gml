/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Flashing visual effect
if boss_iframes > 0
{
	boss_iframes--;
	if boss_iframes%boss_flicker_speed = 0
	{
		if boss_flicker = false
			boss_flicker = true;
		else
			boss_flicker = false;
	}
}
else
	boss_flicker = false;
	
if life <= 0
{
	if death = -1
	{
		death--;
		
		with obj_bullet_default
			alarm[9] = 1;
		
		with obj_player
		{
			movement = false;
			xspeed = 0;
			dash = false;
		}
		
		//Flicker slowly
		boss_iframes = 99999;
		boss_flicker_speed = 12;
		
		action = 0;
		alarm[10] = 60*1;
	}
	
	if exploding > 0
	{
		exploding++;
		if exploding%2 = 0
			instance_create_depth(x+random_range(-300,300),y+random_range(-200,200),10,obj_explosion);
		
		if !instance_exists(obj_explosion_death_line)
		{
			repeat(3)
			{
				line = instance_create_depth(x,y,9,obj_explosion_death_line);
				line.image_angle = irandom(359);
				var scale = random_range(0.75,1.5);
				line.image_xscale = scale;
				line.image_yscale = scale;
			}
		}
		
		if instance_exists(obj_fade_out) and exploding%2 = 0
		{
			line_blue = instance_create_depth(x,y,11,obj_explosion_death_line_2);
			line_blue.image_angle = irandom(359);
			line_blue.direction = line_blue.image_angle;
			line_blue.speed = 10;
		}
	}
}
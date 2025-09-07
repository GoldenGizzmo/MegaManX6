/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	if instance_exists(target)
	{
		center_x = target.x; // x of orbital center
		center_y = target.y; // y of orbital center

		// Orbital motion
		orbit_angle += orbit_speed;
		if orbit_angle >= 360 
			orbit_angle -= 360;
	
		//Immune to damage while appearing
		if orbit < orbit_grow
			orbit += 0.5;
		else
			if sprite_index != spr_yanma_option_giga //Giga drones are always immune
				invul = false;

		// Update position
		if orbit > 0
		{
			x = lengthdir_x(orbit,orbit_angle)+center_x;
			y = lengthdir_y(orbit,orbit_angle)+center_y;
		}
		
		//If boss dies
		if target.life < 0
			life = 0;
			
		//Aim to face the target
		if aim = true
		{
			//Face direction
			if aim_lock = false
			{
				image_angle = target.aim_direction;
				image_xscale = 1;
				if image_angle > 90 and image_angle < 270 //Prevent flipping upside down
					image_yscale = -1;
				else
					image_yscale = 1;
			}
		}
		else
		{
			image_xscale = target.image_xscale;
			image_yscale = 1;
			image_angle = 0;
			aim_lock = false;
		}
		
		//Shuffle order whenever a drone dies so there's no gaps
		if order > 0
		{
			var store_order = order;
			var check = false;
			with object_index
				if order = store_order-1
					check = true
				
			if check = false
				order--;
		}
			
		//Yammark's bomb attack	
		if follow = true
		{
			invul = true; //Can't be killed mid attack
			
			orbit_grow = 0;
			if orbit > 0 //Shrink in orbit distance
				orbit -= 1;
			else
			{
				//Have the drones follow eachother to make a trail
				if order > 0
				{
					var new_target = self;
					var store_order = order;
					with object_index
						if order = store_order-1
							new_target = id; 
							
					target = new_target;
				}
			
				x += (target.x-x)*0.15;
				y += (target.y-y)*0.15;
			}
		}
	}
	else
		life = 0;
		
	//Flashing visual effect
	if boss = true
	{
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
	}
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		instance_create_layer(x,y,"Explosions",obj_explosion);
		scr_make_sound(snd_explosion,1,1,false);
		death = 1;
	}
}
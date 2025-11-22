/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	if shoot  = 0
	{
		flamethrower = flamethrower_length;
		alarm[2] = flamethrower_length+300;	
	
		scr_make_sound(snd_fire,1,1,false);

		for (var i = 0; i < 4; i++)
		{
			fire = instance_create_depth(0,0,depth-1,obj_boss_donut_fire);
			fire.damage = bullet_damage_2;
			fire.owner = self;
	
			var _x,_y,angle;
			switch (i)
			{
				case 0: //Left
					_x = -73;
					_y = -1;
					angle = 180;
					break; 
				case 1:  //Down
					_x = 26;
					_y = 64;
					angle = 270;
					break; 
				case 2: //Right
					_x = 64;
					_y = -10;
					angle = 0;
					break; 
				case 3: //Up
					_x = -8;
					_y = -60;
					angle = 90;
					break; 
			}
	
			fire.x_pos = _x;
			fire.y_pos = _y;
			fire.image_angle = angle;
		}
	}
	else
		alarm[2] = 1;
}
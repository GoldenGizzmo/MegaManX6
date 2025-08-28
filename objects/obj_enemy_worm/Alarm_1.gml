/// @description Insert description here
// You can write your code in this editor

if life > 0
{
	switch (action)
	{
		case 0: //When fully burrowed into the ground
			if animation_ended = true
			{
				animation_ended = false;
				invul = true;
				image_speed = 0;
				image_index = -1;
		
				action++;
				alarm[1] = 120;
			}
			else
				alarm[1] = 1;
			break;
		
		case 1:
			action = 0;
			alarm[0] = 1;
		
			damage = damage_store
			image_index = 1; //Skip the openning box phase
			sprite_index = spr_enemy_worm_rise;
			animation_ended = false;
			break;
	}
}
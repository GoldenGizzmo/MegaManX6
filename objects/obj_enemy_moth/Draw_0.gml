/// @description Insert description here
// You can write your code in this editor

if life > 0 or death < 1
{
	if isHit = true
		event_inherited();
	else
	{
		//If not clinging against a wall
		if action > 0
		{
			//Jet sprite for each position
			var jet = spr_enemy_moth_jet;
			if sprite_index = spr_enemy_moth
			{
				if image_index > 0
					jet = spr_enemy_moth_jet_2
				else if image_index > 1 or image_index = -1
					jet = spr_enemy_moth_jet_3
			}
	
			draw_sprite_ext(jet,global.animate/5,x,y,image_xscale,1,0,c_white,1);
		}
		event_inherited();
	}
}


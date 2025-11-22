/// @description Insert description here
// You can write your code in this editor

//Draw hover effect
ground = collision_line(x,y,x,y+170,obj_solid,false,false);

if instance_exists(ground)
{
	if ground.y > y+60 //If not too close to the ground
	{
		if hover_sound = false
		{
			hover_sound = true;
			scr_make_sound(snd_highmax_hover,1,1,false);
		}
	
		if global.animate%4 = 0
		{
			hover_animate++;
			if hover_animate > 7
				hover_animate = 3;
		}
		draw_sprite(spr_boss_highmax_hover,hover_animate,x,ground.y);
	}
}

if boss_flicker = true
{
	//gpu_set_fog(true,c_ltgrey,0,0);
	draw_self()
	gpu_set_blendmode(bm_add)
	draw_self()
	gpu_set_blendmode(bm_normal)
	//gpu_set_fog(false,c_ltgrey,0,0);
}
else
	draw_self()
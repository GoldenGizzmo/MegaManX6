/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	event_user(3); //Face player
	propeller_spin++;
	
	//Float up and down
	y = ystart+dsin((current_time+hover_delay)*0.4)*4;
	//Float left and right
	x = xstart+dsin((current_time+hover_delay)*0.1)*5;
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		instance_create_layer(x,y,"Explosions",obj_explosion);
		scr_make_sound(snd_explosion,1,1,false);
		
		for (var i = 0; i < 4; i++)
		{
			debris = instance_create_layer(x,y,"Explosions",obj_particle_debris)
			debris.sprite_index = spr_enemy_met_debris;
			debris.image_index = i;
		}
		
		death = 1;
	}
}
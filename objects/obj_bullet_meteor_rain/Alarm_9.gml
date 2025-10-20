/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < 3; i++)
{
	bullet = instance_create_layer(x,y,layer,obj_bullet_meteor_raindrop)
	bullet.direction = 225+(45*i);
	bullet.speed = fall_speed;
	bullet.gravity = fall_gravity;
			
	bullet.damage = damage*2; //Double damage (Intended damage due to tick effect)
	bullet.villainy = villainy;
	bullet.special = special;
	
	scr_make_sound(snd_splash,1,1,false);
}

effect = instance_create_layer(x,y,"Explosions",obj_explosion);
effect.sprite_index = spr_explosion_meteor_rain;
		
instance_destroy();
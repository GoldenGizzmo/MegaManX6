/// @description Misc Attacks

bullet = instance_create_layer(x,y,"Projectiles",obj_bullet_saber);
switch (machdash_direction)
{
	case 270: //Down
		//bullet.offset_x = 8*image_xscale;
		bullet.image_angle = machdash_direction;
		break;
	
	case 90: //Up
		//bullet.offset_x = -8*image_xscale;
		bullet.image_angle = machdash_direction;
		break;
		
	default: //Left or Right
		bullet.offset_y = -8;
		bullet.image_xscale = image_xscale;
		break;
}

bullet.melee_damage = machdash_damage;
bullet.melee_frames = 3;
bullet.sprite_index = spr_bullet_x_machdash;
bullet.melee_slash = false; //Doesn't do the slash effect
bullet.turning = false;
bullet.palette = 1;

//Charged version
if machdash_hold >= machdash_holdmax 
{
	bullet.palette = 0;
	bullet.sprite_index = spr_bullet_x_machdash_charged;
	bullet.melee_damage = machdash_damage*3;
	
	alarm[4] = dash_length/1.5; //50% longer
}
	

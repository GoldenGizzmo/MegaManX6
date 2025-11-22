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
		bullet.offset_y = -4;
		bullet.image_xscale = image_xscale;
		break;
}

bullet.melee_damage = machdash_damage;
bullet.melee_frames = 3;
bullet.sprite_index = spr_bullet_x_machdash;
bullet.melee_slash = false; //Doesn't do the slash effect
bullet.turning = false;
bullet.palette = 3;

if machdash_hold >= machdash_holdmax 
	machdash_charged = true;

//Charged version
if machdash_charged = true
{
	bullet.sprite_index = spr_bullet_x_machdash_charged;
	bullet.melee_damage = machdash_damage*3;
	
	machdash_invul = -1;
	
	scr_make_sound(snd_machdash,1,1,false);
	scr_player_voicelines("Charge Shot");
	
	alarm[4] = dash_length/1.5; //50% longer
}

with bullet
{
	//Part: Saber Plus
	if ds_list_find_index(global.parts_equipped,3) != -1 {scr_get_part_effect(3,false);}	
}
	
if machdash_charged = true
	bullet.palette = 0;
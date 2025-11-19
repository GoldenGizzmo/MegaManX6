/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

x = obj_player.x+offset_x;
y = obj_player.y+offset_y;
if turning = true
	image_xscale = obj_player.image_xscale;

//Every animation has different active frames
damage = 0;
switch sprite_index
{
	//Assigning active frames
	case spr_bullet_x_saber: 
	case spr_bullet_x_saber_fire: 
	if image_index >= 2 and image_index <= 6 {damage = melee_damage} break;
	case spr_bullet_x_saber_jump: 
	case spr_bullet_x_saber_fire_jump: 
	if image_index >= 2 and image_index <= 4 {damage = melee_damage} break;
	case spr_bullet_x_saber_wall: 
	case spr_bullet_x_saber_fire_wall: 
	if image_index >= 2 and image_index <= 4 {damage = melee_damage} break;
	
	case spr_bullet_x_machdash: 
	case spr_bullet_x_machdash_charged:
		if image_index <= 4
			damage = melee_damage
		break;
}

//Destroy if this animation is not playing
switch sprite_index
{
	case spr_bullet_x_saber: 
	case spr_bullet_x_saber_fire: 
	if obj_player.sprite_index != spr_port_x_saber {instance_destroy(id,false)} break;
	case spr_bullet_x_saber_jump: 
	case spr_bullet_x_saber_fire_jump: 
	if obj_player.sprite_index != spr_port_x_saber_jump {instance_destroy(id,false)} break;
	case spr_bullet_x_saber_wall: 
	case spr_bullet_x_saber_fire_wall: 
	if obj_player.sprite_index != spr_port_x_saber_walljump {instance_destroy(id,false)} break;

	case spr_bullet_x_machdash:
	case spr_bullet_x_machdash_charged:
		if !(obj_player.sprite_index = spr_port_x_machdash or obj_player.sprite_index = spr_port_x_machdash_up or obj_player.sprite_index = spr_port_x_machdash_down)
			instance_destroy(id,false);
		break;
}


//Magma Blade projectiles
if sprite_index = spr_bullet_x_saber_fire or sprite_index = spr_bullet_x_saber_fire_jump or sprite_index = spr_bullet_x_saber_fire_wall
{
	if (image_index >= 3 and bullet_delay = 0) or (image_index >= 5 and bullet_delay = 1)
	{
		bullet_delay++;
		
		var wall_slide_reverse = 1;
			if sprite_index = spr_bullet_x_saber_fire_wall
				wall_slide_reverse = -1;
	
		if palette = 1 //Don't spawn projectiles underwater
		{
			//Create bubbles instead
			repeat(3)
			{
				effect = instance_create_depth(x+random_range(20,60)*image_xscale*wall_slide_reverse,y+random_range(-30,30),depth-15,obj_explosion)
				effect.sprite_index = spr_effect_bubbles;
			}
		}
		else
		{
			bullet = instance_create_depth(x+15*image_xscale*wall_slide_reverse,y,depth-(bullet_delay+1),obj_bullet_default)
			bullet.image_xscale = image_xscale*wall_slide_reverse;
			bullet.speed = 6*bullet.image_xscale;
			bullet.sprite_index = spr_bullet_magmablade_spawn;
			bullet.animation_next = spr_bullet_magmablade;
			bullet.explosion = spr_bullet_magmablade_end
			bullet.damage = melee_damage//ceil(melee_damage*1.5);
		
			bullet.villainy = villainy;
		}
	}
}





/*
afterimage = instance_create_depth(x,y,depth+1,obj_afterimage);
afterimage.image_index = image_index;
afterimage.sprite_index = sprite_index;
afterimage.image_xscale = image_xscale;
//afterimage.blendmode = bm_normal;
afterimage.blank = false;
afterimage.fade_speed = 0.12;
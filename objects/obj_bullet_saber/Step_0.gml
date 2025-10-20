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
	case spr_bullet_x_saber: if image_index >= 2 and image_index <= 6 {damage = melee_damage} break;
	case spr_bullet_x_saber_jump: if image_index >= 2 and image_index <= 4 {damage = melee_damage} break;
	case spr_bullet_x_saber_wall: if image_index >= 2 and image_index <= 4 {damage = melee_damage} break;
	
	case spr_bullet_x_machdash: 
	case spr_bullet_x_machdash_charged:
		if image_index <= 4
			damage = melee_damage
		break;
}

//Destroy if this animation is not playing
switch sprite_index
{
	case spr_bullet_x_saber: if obj_player.sprite_index != spr_port_x_saber {instance_destroy(id,false)} break;
	case spr_bullet_x_saber_jump: if obj_player.sprite_index != spr_port_x_saber_jump {instance_destroy(id,false)} break;
	case spr_bullet_x_saber_wall: if obj_player.sprite_index != spr_port_x_saber_walljump {instance_destroy(id,false)} break;

	case spr_bullet_x_machdash:
	case spr_bullet_x_machdash_charged:
		if !(obj_player.sprite_index = spr_player_x_machdash or obj_player.sprite_index = spr_player_x_machdash_up or obj_player.sprite_index = spr_player_x_machdash_down)
			instance_destroy(id,false);
		break;
}
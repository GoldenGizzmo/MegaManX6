/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

x = obj_player.x;
y = obj_player.y;
image_xscale = obj_player.image_xscale;

//Every animation has different active frames
damage = 0;
switch sprite_index
{
	case spr_bullet_x_saber: if image_index >= 2 and image_index <= 6 {damage = melee_damage} break;
	case spr_bullet_x_saber_jump: if image_index >= 2 and image_index <= 4 {damage = melee_damage} break;
	case spr_bullet_x_saber_wall: if image_index >= 2 and image_index <= 4 {damage = melee_damage} break;
}

//Destroy if this animation is not playing
switch sprite_index
{
	case spr_bullet_x_saber: if obj_player.sprite_index != spr_player_x_idle_saber {instance_destroy(id,false)} break;
	case spr_bullet_x_saber_jump: if obj_player.sprite_index != spr_player_x_jump_saber {instance_destroy(id,false)} break;
	case spr_bullet_x_saber_wall: if obj_player.sprite_index != spr_player_x_walljump_saber {instance_destroy(id,false)} break;
}
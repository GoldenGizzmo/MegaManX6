/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if life > 0
{
	//Store damage
	if damage_store = 0
		damage_store = damage;
		
	//If taking damage while weak, retreat into the ground
	if life < lifemax/2	and isHit = true and retreat = false // and (sprite_index != spr_enemy_worm_retreat and sprite_index != spr_enemy_worm_rise)
	{
		retreat = true;
		action = 0;
		alarm[0] = -1;
		alarm[1] = 1;
		
		damage = 0;
		animation_ended = false;
		sprite_index = spr_enemy_worm_retreat;
		image_index = 0;
	}
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		instance_create_layer(x,y,"Explosions",obj_explosion);
		death = 1;
	}
}
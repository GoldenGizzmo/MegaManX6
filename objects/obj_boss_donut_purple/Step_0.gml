/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if global.pause = true
	return;


//Being openning appearance
if state = "Appearance" and action = 0
{
	action++;
	alarm[0] = 1;
}

if life > 0
{	
	//Afterimages
	if global.animate%10 = 0 and image_alpha >= 1
	{
		offset_x = 0;
		offset_y = 0;
		
		var offset_chance = irandom(3);
		var offset_range = 4;
		if offset_chance = 0
		{
			offset_x = random_range(-offset_range,offset_range);
			offset_y = random_range(-offset_range,offset_range);
		}
		
		afterimage = instance_create_depth(x+offset_x,y+offset_y,depth+10,obj_afterimage);
		afterimage.image_blend = choose(c_red,c_purple);
		afterimage.sprite_index = sprite_index;
		afterimage.image_index = image_index;
		afterimage.image_xscale = 1;
	}
	
	//Moving around the arena
	if state = "Moving"// or state = "Charge"
	{
		if shoot = shoot_delay
		{
			energy = instance_create_depth(x,y,depth-1,obj_bullet_charge);
			energy.target = self;
			energy.target_x = -15;
			energy.target_y = 5;
			
			energy.sound = snd_highmax_charge;
			energy.damage = bullet_damage;
			energy.villainy = 2;
			energy.phasing = true;
			
			energy.sprite_index = spr_bullet_nightmare_huge_spawn;
			energy.animation_next = spr_bullet_nightmare_huge;
		}
		
		//Shoot projectiles
		if shoot < shoot_delay+30
			shoot++;
		else
		{
			shoot = 0;
			instance_destroy(energy);
			event_user(10);
		
		}
	}
}
else
{
	//Remove energy
	if variable_instance_exists(id,"energy")
		if instance_exists(energy)
			instance_destroy();

}
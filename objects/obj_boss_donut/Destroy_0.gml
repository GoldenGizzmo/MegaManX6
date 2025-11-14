/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < 12; i++)
{
	var pickup_x = random_range(-60,60);
	var pickup_y = random_range(-60,60);
	var pickup_sprite = spr_pickup_soul_mid;
	if i > 3
		pickup_sprite = spr_pickup_soul_small;
	
	pickup = instance_create_layer(x+pickup_x,y+pickup_y,"Instances",obj_pickup);
	pickup.sprite_index = pickup_sprite;
	pickup.pickup_expiry = 60*8;
}

repeat(3)
{
	spawn = instance_create_depth(x+random_range(-60,60),y+random_range(80,20),depth+1,obj_boss_donut_spawn)
	spawn.flee = true;
	spawn.direction = random_range(90-45,90+45);
}
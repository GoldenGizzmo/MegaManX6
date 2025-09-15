/// @description Give Nightmare Souls

for (var i = 0; i < 4; i++)
{
	pickup = instance_create_layer(x,y-20,"Instances",obj_pickup);
	pickup.pickup_expiry = 60*5;
	pickup.large_soul_state = 10;
	pickup.direction  = 90+random_range(-45,45);
	pickup.speed = random_range(2,4);
	
	//Player doesn't need to collect them (fixes them being in walls)
	pickup.auto_pickup = "Appear";
	
	if i = 0
		pickup.sprite_index = spr_pickup_soul_mid;
	else
		pickup.sprite_index = spr_pickup_soul_small;
}
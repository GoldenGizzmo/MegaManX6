/// @description Insert description here
// You can write your code in this editor

//Check if the player is already moved past it and destroy
if progressed_check = false
{
	progressed_check = true;
	
	if obj_player.x > x
	{
		life = 0;
		death = 1;
		
		ruin = instance_create_layer(x,y,"Instances_Lower",obj_explosion);
		ruin.image_speed = 0;
		ruin.sprite_index = spr_weather_machine_destroyed;
	}
}

if life <= 0
	instance_destroy(other);
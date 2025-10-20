/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Can be paused
if global.pause = true
	return;

if life > 0
{
	if state = "Roaming"
	{
		speed = move_speed;
			
		//If too close to the player or hit
		if distance_to_object(obj_player) < aggro_range or isHit = true or place_meeting(x,y,obj_enemy_stingray_alert)
		{	
			state = "Attacking";
			//Create radius which alerts other enemies
			instance_create_depth(x,y,0,obj_enemy_stingray_alert);
			
			scr_make_sound(snd_stingray,1,1,false);
			effect = instance_create_layer(x,y,"Explosions",obj_particle_reinforcement);
			effect.palette = 1;
		}
	}
	else if state = "Attacking"
	{
		image_speed = 2;
		
		//Turn towards the player
		var a = point_direction(x,y,obj_player.x,obj_player.y);
		direction += sign(dsin(a-direction))*(speed);
		
		//Build to this new speed
		speed = move_speed*4;
	}
	
	image_angle = direction;
	
	//Visual effect
	bubbles++;
	if bubbles%120 = 0
	{
		effect = instance_create_depth(x,y,depth-15,obj_explosion)
		effect.sprite_index = spr_effect_bubbles;
	}
	
	//Die on land
	if !place_meeting(x,y,obj_water)
		life = 0;
		
}
else
{
	if death = 0 and global.pause = false //Lock for alarm
	{
		//Death event
		instance_create_layer(x,y,"Explosions",obj_explosion);
		scr_make_sound(snd_explosion,1,1,false);
		death = 1;
	}
}
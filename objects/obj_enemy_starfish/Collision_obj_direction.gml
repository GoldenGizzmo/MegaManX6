/// @description Insert description here
// You can write your code in this editor


	if direction != other.direction
	{
		if speed > 0
			speed -= 0.01;
		else
			direction = other.direction
	}
	else
	{
		if speed < move_speed
			speed += 0.01;
	}

/// @description Insert description here
// You can write your code in this editor

if gamepad_is_connected(0)
	global.controller = true;
else
	global.controller = false;
event_user(2);
scr_get_input();

//If paused
if global.pause = true
{	
	//Find all objects, save their stats and pause their alarms
	for (var index = 0; index < instance_count; index++)
	{
		var instance = instance_id_get(index);
		if instance_exists(instance)
		{
			//Pause alarms
			for (var alarm_index = 0; alarm_index < 10; alarm_index++)
			{
				var value = instance.alarm[alarm_index];
			
				if value >= 0
					instance.alarm[alarm_index] += 1;
					//add_alarm(instance,alarm_index,value)
			}
		
			//Pause speed
			if instance.speed != 0
				add_speed(instance,instance.speed)
			//Pause animation
			if instance.image_speed != 0
				add_animate(instance,instance.image_speed)
		}
	}
	
	unpause = true;
	
	//Pause for getting an item or somethin
	if global.pause_delay > 0
	{
		global.pause_delay--
		if global.pause_delay = 0
			global.pause = false
	}
	
	//Healing
	if global.pause_healing > 0
	{
		if global.life < global.pause_healing
			global.life += 0.5; //Healing speed
		else
		{
			global.pause = false;
			global.pause_healing = 0;
		}
	}
}
else
{
	//Happen once when unpauses, revert everything to how it was
	if unpause = true
	{
		unpause = false;
	/*
		for (var index = 0; index < array_length(arr_alarms); index++)
		{
			try
			{
				var instance = arr_alarms[index].instance;
				var alarm_index = arr_alarms[index].index;
				var value = arr_alarms[index].value;
			
				instance.alarm[alarm_index] = value
			}
			catch(_exception)
			{
				//Do nothing	
			}
		}*/
	
		for (var index = 0; index < array_length(arr_speed); index++)
		{
			try
			{
				var instance = arr_speed[index].instance;
				var value = arr_speed[index].value;
			
				instance.speed = value;
			}
			catch(_exception) 
			{
				//Do nothing	
			}
		}
		
		for (var index = 0; index < array_length(arr_animate); index++)
		{
			try
			{
				var instance = arr_animate[index].instance;
				var value = arr_animate[index].value;
			
				instance.image_speed = value;
			}
			catch(_exception) 
			{
				//Do nothing	
			}
		}
	}
}










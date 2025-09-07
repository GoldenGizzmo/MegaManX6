/// @description Insert description here
// You can write your code in this editor

	
var obj = instance_place(x, y, obj_direction)
	
if(!stop and obj){
	
	if(axis == AXIS_HORIZONTAL){
		x = scr_snap_to_object(move_speed * dir, axis, obj)
	}
	else
	{
		y = scr_snap_to_object(move_speed * dir, axis, obj)
	}
	
	scr_change_direction(obj.direction_target);

	stop = true;
	alarm[0] = obj.delay;
}
	
var spd = move_speed * dir * !stop;
var internal_spd = ceil(abs(spd)) * sign(spd);
	
if(spd != 0){
	with(obj_dynamic){
	
		obj = instance_place(x, y + 1, other);

		if(obj and obj.axis == AXIS_HORIZONTAL){
	
			var res = scr_move(obj.move_speed * obj.dir * !obj.stop, AXIS_HORIZONTAL, obj)
			if(res == 0)xspeed = 0;
		}
	
	}
}

var _x = x;
var _y = y;


if(axis == AXIS_HORIZONTAL){
	x += spd;
}
else
{
	y += spd;
}


ds_list_clear(coll_list)
var size = instance_place_list(x + (axis == AXIS_HORIZONTAL ? internal_spd : 0), y + (axis == AXIS_VERTICAL ? internal_spd : 0), obj_dynamic, coll_list, false);

for(var i = 0; i < size; i++){
	
	obj = coll_list[| i];
	
	if(axis == AXIS_HORIZONTAL){
		
		with(obj){
			var step = scr_snap_to_object(-spd, other.axis, other) - x;
			scr_move(step, other.axis, undefined, false);
			scr_stop_wall(-spd)
		}
		
	}
	else
	{
		
		with(obj){
			var step = scr_snap_to_object(-spd, other.axis, other) - y;
			scr_move(step, other.axis, undefined, false);
			
			if(spd > 0){
				scr_stop_ceiling()
			}
			else
			{
				scr_stop_floor()
			}
			
		}	
	}
}



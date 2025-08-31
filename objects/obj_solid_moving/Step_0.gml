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
	
	dir *= -1;
	stop = true;
	alarm[0] = 60;
}
	
	
with(obj_dynamic){
	
	obj = instance_place(x, y + 1, other);
	if(object_index == obj_player)show_debug_message(obj)

	if(obj and obj.axis == AXIS_HORIZONTAL){
	
		var res = scr_move(obj.move_speed * obj.dir * !obj.stop, AXIS_HORIZONTAL, obj)
		if(res == 0)xspeed = 0;
	}
	
}
	

if(axis == AXIS_HORIZONTAL){
	x += move_speed * dir * !stop;
}
else
{
	y += move_speed * dir * !stop;
}



ds_list_clear(coll_list)
var size = instance_place_list(x, y, obj_dynamic, coll_list, false);

for(var i = 0; i < size; i++){
	
	obj = coll_list[| i];
	
	if(axis == AXIS_HORIZONTAL){
		
		with(obj){
			var step = scr_snap_to_object(-other.move_speed * other.dir, other.axis, other) - x;
			scr_move(step, other.axis);
		}
		
	}
	else
	{
		
		with(obj){
			var step = scr_snap_to_object(-other.move_speed * other.dir, other.axis, other) - y;
			scr_move(step, other.axis);
			airborne = false;
		}
		
	}
	
}



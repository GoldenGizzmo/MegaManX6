// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function scr_platform_move_objects(internal_spd){
	
	ds_list_clear(coll_list)
	var size = instance_place_list(x + (axis == AXIS_HORIZONTAL ? internal_spd : 0), y + (axis == AXIS_VERTICAL ? internal_spd : 0), obj_dynamic, coll_list, false);

	for(var i = 0; i < size; i++){
	
		obj = coll_list[| i];
	
		if(axis == AXIS_HORIZONTAL){
		
			with(obj){
				var step = scr_snap_to_object(-spd, other.axis, other) - x;
				scr_move(step, other.axis, false);
				scr_stop_wall(-spd)
			}
		
		}
		else
		{
		
			with(obj){
				var step = scr_snap_to_object(-spd, other.axis, other) - y;
				scr_move(step, other.axis, false);
			
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
}

function scr_move_along_with_platform(internal_spd){
	
	
	if(internal_spd != 0){
		with(obj_dynamic){
	
			obj = instance_place(x, y + 1, other);
			if(scr_in_ignore_coll(obj))continue;

			if(obj and obj.axis == AXIS_HORIZONTAL){
	
				var res = scr_move(internal_spd, AXIS_HORIZONTAL, undefined, obj_solid, noone)
				if(res == 0)xspeed = 0;
			}
	
		}
	}
	
}

function scr_check_directions(){
	
	var obj = instance_place(x, y, obj_direction)
	
	if(!stop and obj){
	
		if(axis == AXIS_HORIZONTAL){
			x = scr_snap_to_object(move_speed * dir, axis, obj)
		}
		else
		{
			y = scr_snap_to_object(move_speed * dir, axis, obj)
		}
	
		scr_change_direction(directions_translator[$ obj.direction_target]);

		stop = true;
		alarm[0] = obj.delay;
	}
	
}
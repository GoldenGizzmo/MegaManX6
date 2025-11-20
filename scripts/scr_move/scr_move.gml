// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//spd -> move speed.
//axis -> Wether the move is Horizontal (0) or Vertical (1).
//update_variables -> Wether to update the variables if no collision was found. (like set airborne to true).
//object -> base object to check for collisions for.
//slope -> base slope to check for collisions for.
function scr_move(spd, axis, update_variables = true, object = obj_solid, slope = obj_solid_slope){

	#region setup

		//Save original coordinates
			var _x = x;
			var _y = y;
	
		//Get the position to check
		//It needs to be a bit longer than just the coordinate + the speed
			var internal_spd = ceil(abs(spd)) * sign(spd)
			var hsp = (axis == AXIS_HORIZONTAL) ? internal_spd : 0;
			var vsp = (axis == AXIS_VERTICAL) ? internal_spd : 0;
	
		//Move the instance
			var x_offset = (axis == AXIS_HORIZONTAL) ? spd : 0;
			var y_offset = (axis == AXIS_VERTICAL) ? spd : 0;	
		
			var size = 0;
	
	#endregion
	
	#region slopes check
	
		//First check if there are any slopes
		//This is independent from the check for walls
		if(slope){
			
			ds_list_clear(collision_list)
			size = instance_place_list(_x + hsp, _y + vsp, slope, collision_list, true)
	
			for(var i = 0; i < size; i++){
		
				var col = collision_list[| i];
				if(!col.slope)continue;
				if(scr_check_ignore(col, axis))continue;
				
				
				if(axis != AXIS_VERTICAL or spd < 0){
			
					var res = scr_collide_slope(spd, axis, col, _x, _y);
					if res != 0 return res;
			
					//Run code for when the player lands or hits the ceiling
					if(axis == AXIS_HORIZONTAL){
						return scr_stop_wall(spd);
					}
					else{
						if(spd > 0){
							return scr_stop_floor()
						}
						else
						{
							return scr_stop_ceiling()
						}
					}
				}
		
				return scr_basic_collide(spd, axis, col);
			}
		}
	
	#endregion
	
	#region wall check
		
		if(object){
		
			ds_list_clear(collision_list)
			size = instance_place_list(_x + hsp, _y + vsp, object, collision_list, true)
	
			for(var i = 0; i < size; i++){
		
				var col = collision_list[| i];
				if(col.slope)continue;
				if(scr_check_ignore(col, axis))continue;
				
				return scr_basic_collide(spd, axis, col, _x + hsp, _y + vsp);
			}
		}
		
	#endregion
	
	
	//Actually move, if no collision was found
		x += x_offset;
		y += y_offset;
	
	#region Attach to slope
	
	//Attach to slopes when going down
		if(!airborne and axis == AXIS_VERTICAL and spd > 0){
		
			ds_list_clear(collision_list)
			size = instance_place_list(x, y + SLOPE_CHECK_REACH, object, collision_list, true)
		
		
			var slp = noone;
			var flr = noone;
		
			for(var i = 0; i < size; i++){
			
				var col = collision_list[| i];
				if(col.slope){
					slp = col; 
					break;
				}
					
				if(scr_check_ignore(col, axis))continue;

				flr = col;
			}
		
			if(slp or flr){
				x -= (xspeed - xspeed/SLOPE_SPEED_FACTOR)
				y = scr_snap_to_object(1, AXIS_VERTICAL, slp ? slp : flr, x, y + SLOPE_CHECK_REACH);
			
				return scr_stop_floor();
			}
		}

	#endregion

	if update_variables if axis == AXIS_HORIZONTAL scr_not_stop_horizontal() else scr_not_stop_vertical()
	
	return spd;
}


function scr_check_ignore(col, axis){
	
	try{
		if(!col.collide_horizontal and axis == AXIS_HORIZONTAL){
			scr_add_to_ignore_coll(col)
			return true;
		}
					
		if(!col.collide_vertical and axis == AXIS_VERTICAL){
			scr_add_to_ignore_coll(col)
			return true;
		}
	}
	
	if(scr_in_ignore_coll(col))return true;
	
	return false;
}

function scr_add_to_ignore_coll(col){
	
	if(ds_list_find_index(ignore_coll, col) > -1)return;
	
	ds_list_add(ignore_coll, col)
	ignore_coll_size += 1;
}

function scr_update_ignore_coll(){
	
	
	var i = 0;
	while(i < ignore_coll_size){
		
		
		var col = ignore_coll[| i];
		
		if(!place_meeting(x, y, col)){
			
			ds_list_delete(ignore_coll, i)
			ignore_coll_size -= 1;
			continue;
		}
		
		i++;
	}
	
}

function scr_in_ignore_coll(col){
	
	return ds_list_find_index(ignore_coll, col) > -1;
	
}

function scr_basic_collide(spd, axis, col, _x = x, _y = y){
	
	if(axis == AXIS_HORIZONTAL){
		x = scr_snap_to_object(spd, axis, col, _x, _y);
		return scr_stop_wall(spd, col);
	}
	else
	{
		y = scr_snap_to_object(spd, axis, col, _x, _y);
			
			
		//Run code for when the player lands or hits the ceiling
		if(spd > 0){
			return scr_stop_floor()
		}
		else
		{
			return scr_stop_ceiling()
		}
	}
	
}

function scr_collide_slope(spd, axis, col, _x = x, _y = y){
	
	//Setup
		var step = ceil(abs(spd));
		var side = sign(spd)
		var new_axis = axis == AXIS_HORIZONTAL ? AXIS_VERTICAL : AXIS_HORIZONTAL
	
		var res = 0;
	
		var _x_res = 0;
		var _y_res = 0;
		
	//Collision Check
	
	if(axis == AXIS_HORIZONTAL){
		
		_x = scr_snap_to_object(side, axis, col)

		if(col.type % 2 == 0 and spd > 0)return 0;
		if(col.type % 2 == 1 and spd < 0)return 0;

		if(col.type > 2){
			
			for(var i = step; i > 0; i--){
				_x_res = _x + side * i;
				_y_res = scr_snap_to_object(-1, new_axis, col, _x_res)
			
				if(place_meeting(_x_res, _y_res, obj_solid)){
					continue;
				}
			
				x = _x_res;
				y = _y_res;
				
				return spd;
			}
		}
		else{
			
			for(var i = step; i > 0; i--){
				_x_res = _x + side * i;
				_y_res = scr_snap_to_object(1, new_axis, col, _x_res)
			
				if(place_meeting(_x_res, _y_res, obj_solid)){
					continue;
				}
			
			
				x = _x_res;
				y = _y_res;
				
				return spd;
			}
		}
		
	}
	else
	{
		
		_y = scr_snap_to_object(side, axis, col)
		
		if(col.type % 2 == 0 and spd > 0)return 0;
		if(col.type % 2 == 1 and spd < 0)return 0;
		
		if(col.type > 2){
			
			for(var i = step; i > 0; i--){
				_y_res = _y + side * i
				_x_res = scr_snap_to_object(-1, new_axis, col, undefined, _y_res)
			
				if(place_meeting(_x_res, _y_res, obj_solid)){
					continue;
				}
			
				x = _x_res;
				y = _y_res;
				
				return spd;
			}
		}
		else{
		
			for(var i = step; i > 0; i--){
				_y_res = _y + side * i;
				_x_res = scr_snap_to_object(1, new_axis, col, undefined, _y_res)
			
				if(place_meeting(_x_res, _y_res, obj_solid)){
					continue;
				}
			
				x = _x_res;
				y = _y_res;
				
				return spd;
			}
		}
	}
	
	return 0;
}

//Snap to the object given
function scr_snap_to_object(spd, axis, col, x_ = x, y_ = y){
	
	//Save coordinates
		var _x = x_;
		var _y = y_;
	
	if(axis == AXIS_HORIZONTAL){
		
		if(spd == 0)return _x;
		
		_x = scr_get_excess(spd, _x, col.x);
		while(place_meeting(_x, y_, col)){
			_x -= sign(spd);
		}
		
		return _x;
	}

	if(spd == 0)return _y;
	
	_y = scr_get_excess(spd, _y, col.y);
	while(place_meeting(x_, _y, col)){
		_y -= sign(spd);
	}
	
	
	return _y;
}

//Get coordinate by excess
//Depends on the move direction
function scr_get_excess(spd, pos, col_pos){
	
	if(spd > 0){
		return ceil(abs(pos)) * sign(pos) + frac(col_pos)
	}

	return floor(abs(pos)) * sign(pos) + frac(col_pos)
	
}
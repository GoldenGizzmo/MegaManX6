// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_move(spd, axis, object = obj_solid){

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
	
	ds_list_clear(collision_list)
	var size = instance_place_list(_x + hsp, _y + vsp, obj_solid_slope, collision_list, true)
	
	var ret = 0;
	
	for(var i = 0; i < size; i++){
		
		var col = collision_list[| i];
		if(!col.slope)continue;
		
		if(axis != AXIS_VERTICAL or spd < 0){
			
			var res = scr_collide_slope(spd, axis, col, _x, _y);
			if res != 0 return res;
			
			//Run code for when the player lands or hits the ceiling
			if(axis == AXIS_HORIZONTAL){
				ret = scr_stop_wall(spd);
			}
			else{
				if(spd > 0){
					ret = scr_stop_floor()
				}
				else
				{
					ret = scr_stop_ceiling()
				}
			}
				
			return ret;
		}
		
		return scr_basic_collide(spd, axis, col);
	}
	
	ds_list_clear(collision_list)
	size = instance_place_list(_x + hsp, _y + vsp, obj_solid, collision_list, true)
	
	for(var i = 0; i < size; i++){
		
		var col = collision_list[| i];
		if(col.slope)continue;
		
		return scr_basic_collide(spd, axis, col, _x + hsp, _y + vsp);
	}
	
	x += x_offset;
	y += y_offset;
	
	//Attach to slopes when going down
	if(!airborne and axis == AXIS_VERTICAL and spd > 0){
		
		ds_list_clear(collision_list)
		size = instance_place_list(x, y + SLOPE_CHECK_REACH, object, collision_list, true)
		
		var slope = noone;
		var flr = noone;
		
		for(var i = 0; i < size; i++){
			
			var col = collision_list[| i];
			if(col.slope){
				slope = col; 
				break;
			}
			flr = col;
		}
		
		if(slope or flr){
			x -= (xspeed - xspeed/SLOPE_SPEED_FACTOR)
			y = scr_snap_to_object(1, AXIS_VERTICAL, slope ? slope : flr, x, y + SLOPE_CHECK_REACH);
			
			return scr_stop_floor();
		}
	}

	if axis == AXIS_HORIZONTAL scr_not_stop_horizontal() else scr_not_stop_vertical()
	
	return spd;
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
	
	var step = ceil(abs(spd));
	var side = sign(spd)
	var new_axis = axis == AXIS_HORIZONTAL ? AXIS_VERTICAL : AXIS_HORIZONTAL
	
	var res1 = -1;
	var res2 = -1;
	
	var _x1 = 0;
	var _x2 = 0;
	
	var _y1 = 0;
	var _y2 = 0;
	
	if(axis == AXIS_HORIZONTAL){
		
		_x = scr_snap_to_object(side, axis, col)
		
		for(var i = step; i > 0; i--){
			_x1 = _x + side * i;
			_y1 = scr_snap_to_object(-1, new_axis, col, _x1)
			
			if(place_meeting(_x2, _y2, obj_solid)){
				continue;
			}
			
			if(abs(_y1 - y) <= step){
				res1 = abs(_y1 - y);
				break;
			}
		}
		
		
		for(var i = step; i > 0; i--){
			_x2 = _x + side * i;
			_y2 = scr_snap_to_object(1, new_axis, col, _x2)
			
			if(place_meeting(_x2, _y2, obj_solid)){
				continue;
			}
			
			
			if(abs(_y2 - y) <= step){
				res2 = abs(_y2 - y);
				break;
			}
		}
		
		if(res1 != -1 or res2 != -1){
		
			if(res1 > res2){
				x = _x1
				y = _y1;
			}
			else{
				x = _x2
				y = _y2;
			}
			
			return spd;
		}
		
	}
	else
	{
		
		_y = scr_snap_to_object(side, axis, col)
		
		for(var i = step; i > 0; i--){
			_y1 = _y + side * i
			_x1 = scr_snap_to_object(-1, new_axis, col, undefined, _y1)
			
			if(place_meeting(_x1, _y1, obj_solid)){
				continue;
			}
			
			if(abs(_x1 - x) <= step){
				res1 = abs(_x1 - x);
				break;
			}
		}
		
		
		for(var i = step; i > 0; i--){
			_y2 = _y + side * i;
			_x2 = scr_snap_to_object(1, new_axis, col, undefined, _y2)
			
			if(place_meeting(_x2, _y2, obj_solid)){
				continue;
			}
			
			if(abs(_x2 - x) <= step){
				res2 = abs(_x2 - x);
				break;
			}
		}
		
		if(res1 != -1 or res2 != -1){
		
			if(res1 > res2){
				x = _x1;
			}
			else{
				x = _x2;
			}
			
			return spd;
		}
	}
	
	return 0;
}


function scr_snap_to_object(spd, axis, col, x_ = x, y_ = y){
	
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

function scr_get_excess(spd, pos, col_pos){
	
	if(spd > 0){
		return ceil(abs(pos)) * sign(pos) + frac(col_pos)
	}

	return floor(abs(pos)) * sign(pos) + frac(col_pos)
	
}
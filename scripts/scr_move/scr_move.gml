// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_move(spd, axis, object = obj_solid){

	
	//Save original coordinates
		var _x = x;
		var _y = y;
	
	//Get the position to check
	//It needs to be a bit longer than just the coordinate + the speed
		var internal_spd = ceil(abs(spd)) * sign(spd)
		if(axis == AXIS_HORIZONTAL){
			_x += internal_spd
		}
		else
		{
			_y += internal_spd
		}
	
	
	//Move the instance
		var x_offset = (axis == AXIS_HORIZONTAL) ? spd : 0;
		var y_offset = (axis == AXIS_VERTICAL) ? spd : 0;	
	
		x += x_offset;
		y += y_offset;

	
	ds_list_clear(collision_list)
	var size = instance_place_list(_x, _y, object, collision_list, true)
	
	for(var i = 0; i < size; i++){
		
		var col = collision_list[| i];
		
		if(col.slope and (axis != AXIS_VERTICAL or spd < 0)){
				
				
			var res = scr_collide_slope(spd, axis, col, _x, _y);
			if res != 0 return res;
			
			//Run code for when the player lands or hits the ceiling
			if(AXIS_VERTICAL){
				if(spd > 0){
					scr_stop_floor()
				}
				else
				{
					scr_stop_ceiling()
				}
			}
				
			return 0;
		}
		
		if(axis == AXIS_HORIZONTAL){
			x = scr_snap_to_object(spd, axis, col);
			scr_stop_wall(spd);
		}
		else
		{
			y = scr_snap_to_object(spd, axis, col);
			
			
			//Run code for when the player lands or hits the ceiling
			if(spd > 0){
				scr_stop_floor()
			}
			else
			{
				scr_stop_ceiling()
			}
			
		}
		
		return 0;
	}
	
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
			
			scr_stop_floor()
			return 0;	
		}

	}

	if(axis == AXIS_VERTICAL)airborne = true;
	return spd;
}

function scr_collide_slope(spd, axis, col, _x = x, _y = y){
	
	var step = ceil(abs(spd)/SLOPE_SPEED_FACTOR);
	
	var side = sign(spd)
	var new_axis = axis == AXIS_HORIZONTAL ? AXIS_VERTICAL : AXIS_HORIZONTAL
	
	var res1 = 0;
	var res2 = 0;
	
	var _x1 = 0;
	var _x2 = 0;
	
	var _y1 = 0;
	var _y2 = 0;
	
	if(axis == AXIS_HORIZONTAL){
		
		_x = scr_snap_to_object(side, axis, col)
		
		for(var i = step; i > 0; i--){
			_y1 = scr_snap_to_object(-1, new_axis, col, _x + side * i)
			
			
			if(abs(_y1 - y) <= step){
				res1 = abs(_y1 - y);
				break;
			}
		}
		
		
		for(var i = step; i > 0; i--){
			_y2 = scr_snap_to_object(1, new_axis, col, _x + side * i)
			
			if(abs(_y2 - y) <= step){
				res2 = abs(_y2 - y);
				break;
			}
		}
		
		if(res1 != 0 or res2 != 0){
		
			if(res1 > res2){
				y = _y1;
			}
			else{
				y = _y2;
			}
			
			x = scr_snap_to_object(side, axis, col);
			
			return spd;
		}
		
	}
	else
	{
		
		_y = scr_snap_to_object(side, axis, col)
		
		for(var i = step; i > 0; i--){
			_x1 = scr_snap_to_object(-1, new_axis, col, undefined, _y + side * i)
			
			if(abs(_x1 - x) <= step){
				res1 = abs(_x1 - x);
			}
		}
		
		
		for(var i = step; i > 0; i--){
			_x2 = scr_snap_to_object(1, new_axis, col, undefined, _y + side * i)
			
			if(abs(_x2 - x) <= step){
				res2 = abs(_x2 - x);
			}
		}
		
		if(res1 != 0 or res2 != 0){
		
			if(res1 > res2){
				x = _x1;
			}
			else{
				x = _x2;
			}
			
			y = scr_snap_to_object(side, axis, col);
			
			return spd;
		}
	}
	
	return 0;
}


function scr_snap_to_object(spd, axis, col, x_ = x, y_ = y){
	
	var _x = x_;
	var _y = y_;
	
	var move = 0;
	
	if(axis == AXIS_HORIZONTAL){
		
		if(spd == 0)return _x;
		
		_x = floor(abs(x_)) * sign(x_) + frac(col.x)	
		while(place_meeting(_x - move, y_, col)){
			move += sign(spd);
		}
		
		return _x - move;
	}

	if(spd == 0)return _y;
	
	_y = floor(abs(y_)) * sign(y_) + frac(col.y)	
	while(place_meeting(x_, _y - move, col)){
		move += sign(spd);
	}
	
	return _y - move;
}
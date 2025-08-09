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
				
			return scr_collide_slope(spd, axis, col, _x, _y);
		}
		
		if(axis == AXIS_HORIZONTAL){
			x = scr_snap_to_object(spd, axis, col);
		}
		else
		{
			y = scr_snap_to_object(spd, axis, col);
		}
		
		return 0;
	}
	
	return spd;
}

function scr_collide_slope(spd, axis, col, _x = x, _y = y){
	
	var step = ceil(abs(spd)/sqrt(2));
	
	
	var side = sign(spd)
	var new_axis = axis == AXIS_HORIZONTAL ? AXIS_VERTICAL : AXIS_HORIZONTAL
	
	
	if(axis == AXIS_HORIZONTAL){
		x = scr_snap_to_object(side, axis, col, _x, _y)
	}
	else
	{
		y = scr_snap_to_object(side, axis, col, _x, _y)
	}
	
	show_debug_message($"Slope collided")
	
	
	if(axis == AXIS_HORIZONTAL){
		
		for(var i = step; i > 0; i--){
			_y = scr_snap_to_object(-1, new_axis, col, x + side * i)
			
			if(abs(_y - y) <= step){
				x += side * i;
				y = _y;
				return spd;
			}
		}
		
		
		for(var i = step; i > 0; i--){
			_y = scr_snap_to_object(1, new_axis, col, x + side * i)
			
			if(abs(_y - y) <= step){
				x += side * i;
				y = _y;
				return spd;
			}
		}
	}
	else
	{
		
		for(var i = step; i > 0; i--){
			_x = scr_snap_to_object(-1, new_axis, col, undefined, y + side * i)
			
			if(abs(_x - x) <= step){
				y += side * i;
				x = _x;
				return spd;
			}
		}
		
		
		for(var i = step; i > 0; i--){
			_x = scr_snap_to_object(1, new_axis, col, undefined, y + side * i)
			
			if(abs(_x - x) <= step){
				y += side * i;
				x = _x;
				return spd;
			}
		}
	}
	
	
	return 0;
}


function scr_snap_to_object(spd, axis, col, x_ = x, y_ = y){
	
	var _x = x_;
	var _y = y_;
	
	if(axis == AXIS_HORIZONTAL){
		
		_x = floor(abs(x_)) * sign(x_) + frac(col.x)	
		while(place_meeting(_x, y_, col)){
			show_debug_message($"horizontal loop {spd}")
			_x -= sign(spd);
		}
		
		return _x;
	}
	
	_y = floor(abs(y_)) * sign(y_) + frac(col.y)	
	while(place_meeting(x_, _y, col)){
		show_debug_message($"vertical loop {spd}")
		_y -= sign(spd);
	}
	
	return _y;
}
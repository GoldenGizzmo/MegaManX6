// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_move(spd, axis, object = obj_solid){
	
	if(spd == 0)return 0;
	
	var x_offset = (axis == AXIS_HORIZONTAL) ? spd : 0;
	var y_offset = (axis == AXIS_VERTICAL) ? spd : 0;	
	var _x = x;
	var _y = y;
	var internal_spd = ceil(abs(spd)) * sign(spd)
	
	x += x_offset;
	y += y_offset;
	
	if(axis == AXIS_HORIZONTAL){
		_x = ceil(abs(x)) * sign(x)
	}
	else
	{
		_y = ceil(abs(y)) * sign(y)
	}
	
	ds_list_clear(collision_list)
	var size = instance_place_list(_x, _y, object, collision_list, true)
	
	for(var i = 0; i < size; i++){
		
		var col = collision_list[| i];
		
		if(col.slope and (axis != AXIS_VERTICAL or spd < 0)){
			
			
			var res = scr_collide_slope(internal_spd, axis, col, _x, _y);
			
			if(axis == AXIS_HORIZONTAL){
				y = res[0]
			}
			else
			{
				x = res[0]
			}
			
			return res[1];
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
	
	var step = abs(spd);
	var side = sign(spd)
	var new_axis = axis == AXIS_HORIZONTAL ? AXIS_VERTICAL : AXIS_HORIZONTAL
	
	var new_x = _x;
	var new_y = _y;
	
	
	if(axis == AXIS_HORIZONTAL){
		_x = scr_snap_to_object(side, axis, col, _x, _y)
	}
	else
	{
		_y = scr_snap_to_object(side, axis, col, _x, _y)
	}
	
	
	if(axis == AXIS_HORIZONTAL){
		
		for(var i = step; i > 0; i--){
				
			new_y = scr_snap_to_object(-1, new_axis, col, _x + i * side)
			
			if(abs(_y - new_y) <= step){
				return [new_y, spd];
			}
			
			new_y = scr_snap_to_object(1, new_axis, col, _x + i * side)
			
			if(abs(_y - new_y) <= step){
				return [new_y, spd];
			}
		}
	}
	else
	{
		
		for(var i = step; i > 0; i--){
				
			new_x = scr_snap_to_object(-1, new_axis, col, _x, _y + i * side)
		
			if(abs(_x - new_x) <= step){
				return [new_x, spd];
			}
			
			new_x = scr_snap_to_object(1, new_axis, col, _x, _y + i * side)
			
			if(abs(_x - new_x) <= step){
				return [new_x, spd];
			}
		}
	}
	
	return [axis == AXIS_HORIZONTAL ? _x : _y, 0];
}


function scr_snap_to_object(spd, axis, col, x_ = x, y_ = y){
	
	var _x = x_;
	var _y = y_;
	
	if(axis == AXIS_HORIZONTAL){
		
		_x = floor(abs(x_)) * sign(x_) + frac(col.x)	
		while(place_meeting(_x, y_, col))_x -= sign(spd);
		
		return _x;
	}
	
	_y = floor(abs(y_)) * sign(y_) + frac(col.y)	
	while(place_meeting(x_, _y, col))_y -= sign(spd);
	
	return _y;
}
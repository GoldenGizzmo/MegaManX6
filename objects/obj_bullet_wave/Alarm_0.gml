/// @description Insert description here
// You can write your code in this editor

var offset_x = sprite_width;
var offset_y = 0;
var check = place_meeting(x+(offset_x*2)*spread_direction,y+1,obj_solid) and !place_meeting(x+(offset_x)*spread_direction,y-1,obj_solid)
//Going down a slope
if place_meeting(x+(offset_x*2)*spread_direction,y+16,obj_solid_slope) 
	check = true


switch (side)
{
	case 1:
		offset_y = sprite_width;
		offset_x = 0;
		check = place_meeting(x+1,y+(offset_y*1.5)*spread_direction,obj_solid) and !place_meeting(x-1,y+(offset_y)*spread_direction,obj_solid)
		break;
	
	case 2:
		check = place_meeting(x+(offset_x*2)*spread_direction,y-1,obj_solid) and !place_meeting(x+(offset_x)*spread_direction,y+1,obj_solid)
		break;
		
	case 3:
		offset_y = sprite_width;
		offset_x = 0;
		check = place_meeting(x-1,y+(offset_y*1.5)*spread_direction,obj_solid) and !place_meeting(x+1,y+(offset_y)*spread_direction,obj_solid)
		break;
}

if check
{
	bullet = instance_create_depth(x+offset_x*spread_direction,y+offset_y*spread_direction,depth,object_index);
	bullet.sprite_index = sprite_index;
	bullet.damage = damage;
	bullet.spread_direction = spread_direction;
	bullet.villainy = villainy;
	bullet.side = side;
	bullet.image_angle = image_angle;
	bullet.image_alpha = 1;
}
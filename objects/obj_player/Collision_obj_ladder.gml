/// @description Insert description here
// You can write your code in this editor

//Grabbing onto a ladder from the side or bottom
if global.input_up and climbing = false and climbing_dismount = false
{
	climbing = true
					
	//Snap to ladder
	x = instance_place(x,y,obj_ladder).x+8;
					
	//Stop all speed
	yspeed = 0;
	xspeed = 0;
	dash = false;
	wall_jump = false;
}
if !global.input_up and !global.input_down //Repress to grab
	climbing_dismount = false;

//Grabbing onto a lader from the top
if global.input_down_pressed and climbing = false and obj_player.y < (other.y+16*other.image_yscale)-0.1 and climbing_dismount = false
{	
	climbing = true
	
	//Snap to ladder
	x = instance_place(x,y,obj_ladder).x+8;
					
	//Stop all speed
	yspeed = 0;
	xspeed = 0;
	dash = false;
	wall_jump = false;
	
	if y < other.y
		y += 24;
}















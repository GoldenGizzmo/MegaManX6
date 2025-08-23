/// @description Dash Reset

if place_meeting(x,y+1,obj_solid)
{
	dash = false;
	airdash_lock = false;
	//sprite_index = spr_player_x_dash_end;
}
else
	alarm[4] = 1;
	
if airdash_state > 1
{
	xspeed = 0;
	yspeed = 0;
	
	invul = false;
	event_user(5); //Air dash end
}









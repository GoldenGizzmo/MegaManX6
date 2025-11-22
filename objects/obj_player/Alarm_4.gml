/// @description Dash Reset

if place_meeting(x,y+1,obj_solid)
{
	dash = false;
	airdash_lock = false;
	xspeed = 0;
}
else
	alarm[4] = 1;
	
if airdash_state > 1
{
	if hurt = false //Halt movement after dash
	{
		xspeed = 0;
		yspeed = 0;
	}
	
	invul = false;
	invul_bullet = false;
	invul_contact = false;
	event_user(5); //Air dash end
}









/// @description Insert description here
// You can write your code in this editor

// Orbital motion
if orbit_freeze = false
{
	orbit_angle += orbit_speed;
	if orbit_angle >= 360 
		orbit_angle -= 360;
}
	
//Immune to damage while appearing
if orbit < orbit_grow
	orbit += 0.5*image_yscale;

// Update position
if orbit > 0
{
	x = lengthdir_x(orbit,orbit_angle)+center_x;
	y = lengthdir_y(orbit,orbit_angle)+center_y;
}
/// @description Insert description here
// You can write your code in this editor

weapon = global.give_weapon;

if action > 0
{
	portrait_x += ((display_get_gui_width()/2+90*global.ui_scale)-portrait_x)*0.05;
	for (var i = 0; i < 4; i++)
		portait_afterimage[i].x_pos += ((display_get_gui_width()/2+90*global.ui_scale)-portait_afterimage[i].x_pos)*portait_afterimage[i].move_speed;
}
	
if action > 3
{
	move_away -= 5*global.ui_scale; 
	explaination_y += (0-explaination_y)*0.05;
}
	
//Player can still get hit, but can't die
global.life = global.lifemax;
//Infinite ammo
global.weapon[global.weapon_choice].ammo = global.weapon[global.weapon_choice].ammo_max

//Turn off enemy item drops
with obj_enemy_parent
	drop_pickup = false;
	
if action >= 6
{
	text_counting++;
	if text_counting%2 = 0 and text_scrolling < string_length(weapon_description_long)
		text_scrolling++;
}
	
	
	
//Press start to leave the weapon testing
continue_fade = 0.5+dsin((current_time)*0.2)*0.5;

if global.input_start_pressed and ending = false
{
	ending = true;
	fade_end = instance_create_depth(obj_camera.x,obj_camera.y,0,obj_fade_out)
	fade_end.fade_speed = 0.05;
}
if ending = true
{
	if fade_end.alpha >= 1
		room_goto(rm_yammark);
}
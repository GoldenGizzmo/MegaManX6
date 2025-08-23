/// @description Insert description here
// You can write your code in this editor

draw_self();

if active = true
{
	var icon = 0;
	switch (upgrade)
	{
		case "Blade Head":
		case "Shadow Head":
			icon = spr_capsule_head;
			break;

		case "Blade Chest":
		case "Shadow Chest":
			icon = spr_capsule_chest;
			break;
		
		case "Blade Arm":
		case "Shadow Arm":
			icon = spr_capsule_arm;
			break;
		
		case "Blade Leg":
		case "Shadow Leg":
			icon = spr_capsule_leg;
			break;
	}
	if icon != 0 and state < 8
		draw_sprite(icon,image_index,x,y-44);

	dr_light_direction = 1;
	if obj_player.x > x
		dr_light_direction = -1;

	if state < 4
		draw_sprite_ext(spr_capsule_light,0,x,y,dr_light_direction,image_yscale,0,c_white,1-active_alpha);	
	draw_sprite_ext(spr_capsule_light_talk,0,x,y,dr_light_direction,image_yscale,0,c_white,dr_light_alpha);	
	//draw_sprite_ext(spr_capsule_light,0,x,y,dr_light_direction,image_yscale,0,c_white,0.8-dr_light_alpha);

	if flicker = false
		draw_sprite_ext(spr_capsule_active,0,x,y,image_xscale,image_yscale,0,c_white,active_alpha);
}
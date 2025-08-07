/// @description Default Bindings

//Controller
if global.controller = true
{
	//Controller Bindings	
	button_up = gp_axislv;
	button_down = gp_axislv;
	button_left = gp_axislh;
	button_right = gp_axislh;
	
	button_up_2 = gp_padu;
	button_down_2 = gp_padd;
	button_left_2 = gp_padl;
	button_right_2 = gp_padr;
	
	button_shoot = gp_face3;
	button_special = gp_face2;
	button_jump = gp_face1;
	button_dash = gp_shoulderl;
	button_giga = gp_face4;
	
	button_swap_left = gp_shoulderlb;
	button_swap_right = gp_shoulderrb;
	
	button_start = gp_start;
	button_select = gp_select;
	button_shoot_2 = gp_face3;
	button_special_2 = gp_face1;
	button_jump_2 = gp_face2;
}
else
{
	//Keyboard Bindings
	button_up = ord("W");
	button_down = ord("S");
	button_left = ord("A");
	button_right = ord("D");
	
	button_up_2 = 0;
	button_down_2 = 0;
	button_left_2 = 0;
	button_right_2 = 0;

	button_shoot = ord("J");
	button_jump = ord("K");
	button_special = ord("H");
	button_dash = ord("L");
	button_giga = vk_lshift;
	
	button_swap_left = ord("O");
	button_swap_right = ord("P");

	button_start = vk_escape;
	button_select = vk_enter;
	button_shoot_2 = ord("J");
	button_jump_2 = ord("K");
	button_special_2 = ord("H");
}
///scr_get_input
function scr_get_input() {

//jump_trigger = false
var paused_controls = false;
if global.pause = true
	if global.pause_screen = true
		paused_controls = true;

#region Directions
	global.input_up = keyboard_check(button_up) or keyboard_check(button_up_2) or gamepad_button_check(0,button_up_2) or (gamepad_axis_value(0,button_up)<-0.7);
	global.input_up_released = keyboard_check_released(button_up) or keyboard_check_released(button_up_2) or gamepad_button_check_released(0,button_up_2) or (gamepad_axis_value(0,button_up)<-0.7);

	global.input_down = keyboard_check(button_down) or keyboard_check(button_down_2) or gamepad_button_check(0,button_down_2) or (gamepad_axis_value(0,button_down)>0.7);
	global.input_down_released = keyboard_check_released(button_down) or keyboard_check_released(button_down_2) or gamepad_button_check_released(0,button_down_2) or (gamepad_axis_value(0,button_down)>0.7);

	global.input_left = keyboard_check(button_left) or keyboard_check(button_left_2) or gamepad_button_check(0,button_left_2) or (gamepad_axis_value(0,button_left)<-0.7);
	global.input_left_released = keyboard_check_released(button_left) or keyboard_check_released(button_left_2) or gamepad_button_check_released(0,button_left_2) or (gamepad_axis_value(0,button_left)<-0.7);

	global.input_right = keyboard_check(button_right) or keyboard_check(button_right_2) or gamepad_button_check(0,button_right_2) or (gamepad_axis_value(0,button_right)>0.7);
	global.input_right_released = keyboard_check_released(button_right) or keyboard_check_released(button_right_2) or gamepad_button_check_released(0,button_right_2) or (gamepad_axis_value(0,button_right)>0.7);

	//Joystick pressed
	if global.controller = true
	{
		if jump_trigger = false
		{
			if gamepad_axis_value(0,button_up) < -obj_menu_paused.controller_deadzone
				global.input_up_pressed = gamepad_axis_value(0,button_up)<0 or gamepad_button_check_pressed(0,button_up_2)
			else if gamepad_axis_value(0,button_down) > obj_menu_paused.controller_deadzone
				global.input_down_pressed = gamepad_axis_value(0,button_down)>0 or gamepad_button_check_pressed(0,button_down_2)
			else if gamepad_axis_value(0,button_left) < -obj_menu_paused.controller_deadzone
				global.input_left_pressed = gamepad_axis_value(0,button_left)<0 or gamepad_button_check_pressed(0,button_left_2)
			else if gamepad_axis_value(0,button_right) > obj_menu_paused.controller_deadzone
				global.input_right_pressed = gamepad_axis_value(0,button_right)>0 or gamepad_button_check_pressed(0,button_right_2)
		
			if (gamepad_axis_value(0,gp_axislv) > obj_menu_paused.controller_deadzone or gamepad_axis_value(0,gp_axislv) < -obj_menu_paused.controller_deadzone or gamepad_axis_value(0,gp_axislh) > obj_menu_paused.controller_deadzone or gamepad_axis_value(0,gp_axislh) < -obj_menu_paused.controller_deadzone)
				jump_trigger = true; 
		}
		else
		{
			global.input_up_pressed = gamepad_button_check_pressed(0,button_up_2);
			global.input_down_pressed = gamepad_button_check_pressed(0,button_down_2);
			global.input_left_pressed = gamepad_button_check_pressed(0,button_left_2);
			global.input_right_pressed = gamepad_button_check_pressed(0,button_right_2);
		}

		if (gamepad_axis_value(0,gp_axislv)<0.3 and gamepad_axis_value(0,gp_axislv)>-0.3 and gamepad_axis_value(0,gp_axislh)<0.3 and gamepad_axis_value(0,gp_axislh)>-0.3)
		{
			global.input_up_pressed = gamepad_button_check_pressed(0,button_up_2);
			global.input_down_pressed = gamepad_button_check_pressed(0,button_down_2);
			global.input_left_pressed = gamepad_button_check_pressed(0,button_left_2);
			global.input_right_pressed = gamepad_button_check_pressed(0,button_right_2);
			jump_trigger = false;
		}
	}
	else
	{
		if paused_controls = true
		{
			global.input_up_pressed = keyboard_check_pressed(button_up_2);
			global.input_down_pressed = keyboard_check_pressed(button_down_2);
			global.input_left_pressed = keyboard_check_pressed(button_left_2);
			global.input_right_pressed = keyboard_check_pressed(button_right_2);
		}
		else
		{
			global.input_up_pressed = keyboard_check_pressed(button_up)
			global.input_down_pressed = keyboard_check_pressed(button_down)
			global.input_left_pressed = keyboard_check_pressed(button_left)
			global.input_right_pressed = keyboard_check_pressed(button_right)
		}
	}
#endregion
#region Actions
	global.input_shoot = keyboard_check(button_shoot) or keyboard_check(button_shoot_2) or gamepad_button_check(0,button_shoot);
	global.input_shoot_pressed = keyboard_check_pressed(button_shoot) or gamepad_button_check_pressed(0,button_shoot);
	if paused_controls = true
		global.input_shoot_pressed = keyboard_check_pressed(button_shoot_2) or gamepad_button_check_pressed(0,button_shoot_2);
	global.input_shoot_released = keyboard_check_released(button_shoot) or keyboard_check_released(button_shoot_2) or gamepad_button_check_released(0,button_shoot);

	global.input_jump = keyboard_check(button_jump) or keyboard_check(button_jump_2) or gamepad_button_check(0,button_jump);
	global.input_jump_pressed = keyboard_check_pressed(button_jump) or gamepad_button_check_pressed(0,button_jump);
	if paused_controls = true
		global.input_jump_pressed = keyboard_check_pressed(button_jump_2) or gamepad_button_check_pressed(0,button_jump_2);
	global.input_jump_released = keyboard_check_released(button_jump) or keyboard_check_released(button_jump_2) or gamepad_button_check_released(0,button_jump);

	global.input_special = keyboard_check(button_special) or keyboard_check(button_special_2) or gamepad_button_check(0,button_special);
	global.input_special_pressed = keyboard_check_pressed(button_special) or gamepad_button_check_pressed(0,button_special);
	if paused_controls = true
		global.input_special_pressed = keyboard_check_pressed(button_special_2) or gamepad_button_check_pressed(0,button_special_2);
	global.input_special_released = keyboard_check_released(button_special) or keyboard_check_released(button_special_2) or gamepad_button_check_released(0,button_special);

	global.input_dash = keyboard_check(button_dash) or gamepad_button_check(0,button_dash);
	global.input_dash_pressed = keyboard_check_pressed(button_dash) or gamepad_button_check_pressed(0,button_dash);
	global.input_dash_released = keyboard_check_released(button_dash) or gamepad_button_check_released(0,button_dash);

	global.input_giga = keyboard_check(button_giga) or gamepad_button_check(0,button_giga);
	global.input_giga_pressed = keyboard_check_pressed(button_giga) or gamepad_button_check_pressed(0,button_giga);
	global.input_giga_released = keyboard_check_released(button_giga) or gamepad_button_check_released(0,button_giga);

	global.input_swap_left = keyboard_check(button_swap_left) or gamepad_button_check(0,button_swap_left);
	global.input_swap_left_pressed = keyboard_check_pressed(button_swap_left) or gamepad_button_check_pressed(0,button_swap_left);
	global.input_swap_left_released = keyboard_check_released(button_swap_left) or gamepad_button_check_released(0,button_swap_left);

	global.input_swap_right = keyboard_check(button_swap_right) or gamepad_button_check(0,button_swap_right);
	global.input_swap_right_pressed = keyboard_check_pressed(button_swap_right) or gamepad_button_check_pressed(0,button_swap_right);
	global.input_swap_right_released = keyboard_check_released(button_swap_right) or gamepad_button_check_released(0,button_swap_right);
#endregion
#region Minor Actions
	global.input_start = keyboard_check(button_start) or gamepad_button_check(0,button_start);
	global.input_start_pressed = keyboard_check_pressed(button_start) or gamepad_button_check_pressed(0,button_start);
	global.input_start_released = keyboard_check_released(button_start) or gamepad_button_check_released(0,button_start);
	
	global.input_select = keyboard_check(button_select) or gamepad_button_check(0,button_select);
	global.input_select_pressed = keyboard_check_pressed(button_select) or gamepad_button_check_pressed(0,button_select);
	global.input_select_released = keyboard_check_released(button_select) or gamepad_button_check_released(0,button_select);
#endregion
}

function scr_keybinds()
{
	key[9] = "Tab"
	key[8] = "Backspace"
	key[160] = "Left Shift"
	key[162] = "Left Control"
	key[164] = "Left Alt"
	key[165] = "Right Alt"
	key[92] = "Right Windows Key"
	key[163] = "Right Control"
	key[161] = "Right Shift"

	key[12] = "Num 5" // This is actual Num 5 but when Numlock is off, even Wiki says it "Does Nothing"
	key[13] = "Enter"

	key[16] = "Shift"
	key[17] = "Control"
	key[18] = "Alt"
	key[19] = "Pause"
	key[20] = "Capslock"

	key[32] = "Space"
	key[33] = "Page up"
	key[34] = "Page down"
	key[35] = "End"
	key[36] = "Home"

	// key[27] = "Escape" // cant be used because its used to exit this menu

	key[37] = "Left"
	key[38] = "Up"
	key[39] = "Right"
	key[40] = "Down"

	key[45] = "Insert"
	key[46] = "Delete"

	key[48] = "0"
	key[49] = "1"
	key[50] = "2"
	key[51] = "3"
	key[52] = "4"
	key[53] = "5"
	key[54] = "6"
	key[55] = "7"
	key[56] = "8"
	key[57] = "9"

	key[65] = "A"
	key[66] = "B"
	key[67] = "C"
	key[68] = "D"
	key[69] = "E"
	key[70] = "F"
	key[71] = "G"
	key[72] = "H"
	key[73] = "I"
	key[74] = "J"
	key[75] = "K"
	key[76] = "L"
	key[77] = "M"
	key[78] = "N"
	key[79] = "O"
	key[80] = "P"
	key[81] = "Q"
	key[82] = "R"
	key[83] = "S"
	key[84] = "T"
	key[85] = "U"
	key[86] = "V"
	key[87] = "W"
	key[88] = "X"
	key[89] = "Y"
	key[90] = "Z"
	key[91] = "Windows Key"

	key[93] = "Context Menu"

	key[96] = "Num 0"
	key[97] = "Num 1"
	key[98] = "Num 2"
	key[99] = "Num 3"
	key[100] = "Num 4"
	key[101] = "Num 5"
	key[102] = "Num 6"
	key[103] = "Num 7"
	key[104] = "Num 8"
	key[105] = "Num 9"

	key[106] = "Num *"
	key[107] = "Num +"
	key[109] = "Num -"
	key[110] = "Num ."
	key[111] = "Num /"


	key[112] = "F1"
	key[113] = "F2"
	key[114] = "F3"
	key[115] = "F4" // was left black
	key[116] = "F5" // was left black
	key[117] = "F6" // was left black
	key[118] = "F7"
	key[119] = "F8"
	key[120] = "F9" // was left black
	key[121] = "F10"
	key[122] = "F11"
	key[123] = "F12" // was left black

	key[144] = "NUMLOCK"

	key[173] = "Mute"
	key[173] = "Volume Down"
	key[173] = "Volume Up"

	key[186] = ";"
	key[187] = "="
	key[188] = ","
	key[189] = "-"
	key[190] = "."
	key[191] = "/"
	key[192] = "'" // actually `

	key[219] = "["
	//key[220] = "\"
	key[221] = "]"
	key[222] = "\#" // actually # but that needs to be escaped

	key[223] = "`" // actually ` but that needs to be escaped
}

function scr_controllerbinds()
{
	var key = argument[0];
	button = "Unknown";
	
	switch (key)
	{
		case gp_face1: button = "A"; break;
		case gp_face2: button = "B"; break;
		case gp_face3: button = "X"; break;
		case gp_face4: button = "Y"; break;
		
		case gp_shoulderl: button = "LB"; break;
		case gp_shoulderlb: button = "LT"; break;
		case gp_shoulderr: button = "RB"; break;
		case gp_shoulderrb: button = "RT"; break;
		
		case gp_stickl: button = "L3"; break;
		case gp_stickr: button = "R3"; break;
		case gp_select: button = "Select"; break;
		
		//Can't be detected for some reason
		case gp_padu: button = "Dpad Up"; break;
		case gp_padd: button = "Dpad Down"; break;
		case gp_padl: button = "Dpad Left"; break;
		case gp_padr: button = "Dpad Right"; break;
	}
	return button;
}

function scr_gamepad_check(button)
{
	button = argument[0];
	/*var check = false;
		for (var i = 0; i < 11; i++)
			if controller[i] = button
				check = true
	
	if check = true
	{
		scr_make_sound(snd_electricity,0,0);
		key_select = false;
	}
	else
	{*/
		controller[menu_position+4] = button;
		key_select = false;
	//}
}

function scr_get_direction()
{
	//Gives direction held (8 directions for keyboard and gamepad, 360 for joystick)
	temp_direction = argument[0];
	var haxis = gamepad_axis_value(0,gp_axislh);
	var vaxis = gamepad_axis_value(0,gp_axislv);
	if global.controller = true
		if global.input_up or global.input_down or global.input_left or global.input_right
			temp_direction = point_direction(0,0,haxis,vaxis);

	if haxis < obj_menu_paused.controller_deadzone and haxis > -obj_menu_paused.controller_deadzone and vaxis < obj_menu_paused.controller_deadzone and vaxis > -obj_menu_paused.controller_deadzone
	{
		if global.input_left
		{
			temp_direction = 180;
			if global.input_down
				temp_direction = 180+45;
			else if global.input_up
				temp_direction = 180-45;
		}
		else if global.input_right
		{
			temp_direction = 0;
			if global.input_down
				temp_direction = -45;
			else if global.input_up
				temp_direction = 45;
		}
		else
		{
			if global.input_up
				temp_direction = 90;
			else if global.input_down
				temp_direction = -90;
		}
	}
	return temp_direction;
}
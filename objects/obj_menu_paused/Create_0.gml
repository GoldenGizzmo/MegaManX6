/// @description Insert description here
// You can write your code in this editor

//Pausing the game for healing, attacks, doors
arr_alarms = [];
arr_speed = [];
arr_animate = [];
arr_gravity = [];

add_alarm = function(instance,index,value)
{
	array_push(arr_alarms,{instance,index,value})
	
	instance.alarm[index] = -1;
}

add_speed = function(instance,value)
{
	array_push(arr_speed,{instance,value})
	
	instance.speed = 0;
}

add_animate = function(instance,value)
{
	array_push(arr_animate,{instance,value})
	
	instance.image_speed = 0;
}

add_gravity = function(instance,value)
{
	array_push(arr_gravity,{instance,value})
	
	instance.gravity = 0;
}

global.pause_healing = 0;
global.pause_delay = 0;
global.pause_screen = false;
global.pause_screen_state = 0;
global.pause_screen_speed = 0.1;
global.pause_menu = "Paused";
global.pause_menu_sub = "Options";
pause_animate = 0;
tank_animate = 0;
tank_filling = -1;
tank_filling_full = false;
unpause = false;
menu_description = "Nothing";
key_select = false;

//Used for part menu
length = 0;
length_limit = 10;
scroll = 0;
text_change = 0;
text_scrolling = 0;

menu_state = "Weapons";
menu_position = 0;
menu_position_sub = 0;
menu_tank[0] = global.subtank_1;
menu_tank[1] = global.subtank_2;
menu_tank[2] = global.weapontank;

text_scrolling = 0;
text_change = 0;

stageselect_state = 0;
stageselect_entrance = 7;
stageselect_bg_swap = 0;
stageselect_bg_static = 0.05;
if room = rm_stage_select
	alarm[2] = 15; 
stageselect[0] = {position : 0, alpha : 1.1};
stageselect[1] = {position : 3, alpha : 1.1};
stageselect[2] = {position : 1, alpha : 1.1};
stageselect[3] = {position : 4, alpha : 1.1};
stageselect[4] = {position : 6, alpha : 1.1};
stageselect[5] = {position : 2, alpha : 1.1};
stageselect[6] = {position : 7, alpha : 1.1};
stageselect[7] = {position : 5, alpha : 1.1};

blink = 0;
alarm[0] = 1;

//Bindings
list = 0;
command = 0;

//Keyboard Bindings
keyboard[0] = ord("W"); //W
keyboard[1] = ord("A"); //A
keyboard[2] = ord("S"); //S
keyboard[3] = ord("D"); //D

keyboard[4] = ord("J"); //J
keyboard[5] = ord("K"); //K
keyboard[6] = ord("H"); //H
keyboard[7] = ord("L"); //L
keyboard[8] = ord("W"); //W

keyboard[9] = ord("O"); //W
keyboard[10] = ord("P"); //W

//Can't change
keyboard[11] = vk_escape;
keyboard[12] = vk_enter;

//Menu Bindings
keyboard[13] = ord("W");
keyboard[14] = ord("A");
keyboard[15] = ord("S");
keyboard[16] = ord("D");
keyboard[17] = ord("J");
keyboard[18] = ord("K");
keyboard[19] = ord("H");

//Controller Bindings
controller[0] = gp_axislv;
controller[1] = gp_axislh;
controller[2] = gp_axislv;
controller[3] = gp_axislh;
	
controller[4] = gp_face3;
controller[5] = gp_face1;
controller[6] = gp_shoulderr;
controller[7] = gp_shoulderl;
controller[8] = gp_face4;

controller[9] = gp_shoulderlb;
controller[10] = gp_shoulderrb;

//Can't change
controller[11] = gp_start;
controller[12] = gp_start;

controller[13] = gp_padu;
controller[14] = gp_padl;
controller[15] = gp_padd;
controller[16] = gp_padr;
controller[17] = gp_face3;
controller[18] = gp_face1;
controller[19] = gp_face2;

//Setup default inputs
global.controller = true;
event_user(2);
jump_trigger = false;
key_select = false;
controller_deadzone = 0.7;
controller_toggle = true;




//Pause for the stage select screen
if room = rm_stage_select
{
	global.pause = true;
	global.pause_screen = true
	global.pause_menu = "Stage Select";
	global.pause_screen_state = 1
}










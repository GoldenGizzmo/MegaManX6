/// @description Insert description here
// You can write your code in this editor

//This object is for items and mechanics that carry over from level to level

global.ui_scale = 5;

//Sound Variables
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sfx);
global.volume_master = 0.5; //50%
global.volume_music = 0; //100%
global.volume_effect = 1; //100%
audio_group_set_gain(audiogroup_sfx,global.volume_effect*global.volume_master,0);
audio_group_set_gain(audiogroup_music,global.volume_music*global.volume_master,0);

global.controller = false;
event_user(2); //Key bindings
scr_get_input();

current_area = noone;
global.pause = false;

global.fnt_game = font_add_sprite_ext(spr_font_game,"!~#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPKRSTUVWXYZ[\]^_``abcdefghijklmnopqrstuvwxyz",true,1);
draw_set_font(global.fnt_game);

//Special Weapons
global.weapon_choice = 0;
//Set up special weapons
for (i = 0; i < 9; i++)
	global.weapon[i] = {type : 0, ammo_max : 0, ammo : 0, charge_cost : 1}; 
	
global.weapon[0] = {type : "X-Saber", ammo_max : -1, ammo : -1, charge_cost : -1}; 
global.weapon[6] = {type : "Meteor Rain", ammo_max : 20, ammo : 20, charge_cost : 3}; 
global.weapon[8] = {type : "Ray Arrow", ammo_max : 55, ammo : 55, charge_cost : 25}; 	

global.nightmare_souls = 0;
global.rescue_list = ds_list_create(); //Checks reploids rescued
global.pickup_list = ds_list_create(); //Checks pickups like heart tanks and sub tanks are collected

//Heart Tanks
global.hearttank = 0;
//Other Tanks
global.subtank_1 = -1;
global.subtank_2 = -1;
global.weapontank = -1;
global.powertank = 0;
//EX Tank LMAO

//Light Capsules
//Checks if capsules are aquired
global.blade_head_get = false;
global.blade_chest_get = false;
global.blade_arm_get = false;
global.blade_leg_get = false;
global.shadow_head_get = false;
global.shadow_chest_get = false;
global.shadow_arm_get = false;
global.shadow_leg_get = false;
//Armour parts equipped right now
global.x_armour_head = 0;
global.x_armour_chest = 0;
global.x_armour_arm = 0;
global.x_armour_leg = 0//"Blade Leg";

global.seen_boss_cutscene = 0;
global.current_level = rm_yammark//noone;
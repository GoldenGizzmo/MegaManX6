/// @description Insert description here
// You can write your code in this editor

//This object is for items and mechanics that carry over from level to level

global.ui_scale = 5;

global.controller = false;
event_user(2); //Key bindings
scr_get_input();

current_area = noone;
global.pause = false


//Special Weapons
global.weapon_choice = 0;
//Set up special weapons
for (i = 0; i < 9; i++)
	global.weapon[i] = {type : 0, ammo_max : 0, ammo : 0, charge_cost : 1}; 
	
global.weapon[0] = {type : "X-Saber", ammo_max : -1, ammo : -1, charge_cost : -1}; 
global.weapon[6] = {type : "Meteor Rain", ammo_max : 20, ammo : 20, charge_cost : 3}; 
global.weapon[8] = {type : "Ray Arrow", ammo_max : 55, ammo : 55, charge_cost : 25}; 	

//Heart Tanks
global.hearttank = 0;
//Other Tanks
global.subtank_1 = -1;
global.subtank_2 = -1;
global.weapontank = -1;
global.powertank = 0;
//EX Tank LMAO


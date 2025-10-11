/// @description Insert description here
// You can write your code in this editor

//Get weapon based on the previous room (boss defeated)
switch (room)
{
	case rm_yammark: scr_weapon_get(1,"Yanma Option"); break;
	case rm_turtloid: scr_weapon_get(6,"Meteor Rain"); break;
}
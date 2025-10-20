/// @description Insert description here
// You can write your code in this editor

movement = true;

finish = false;
speaking_is_right = false;

animation_x = 0;
animation_y = 0;
animation_static = 1;

left_character = "Player";
left_mugshot = spr_mugshot_x;
left_mugshot_talk = spr_mugshot_x_talk;
left_blink = 4;
left_talking = 0;
alarm[1] = 1;

right_character = "Villain";
right_mugshot = spr_mugshot_x;
right_mugshot_talk = spr_mugshot_x_talk;
right_blink = 4;
right_talking = 0;
alarm[2] = 1;

//Dialogue mechanics
page = 0;
timer = 0;
cutoff = 0;
text_delay = 0; //For appearance animation

name_hidden = false;
dialogue = 0;
flash = 0;

dr_light_flicker = false;
alarm[3] = 60;
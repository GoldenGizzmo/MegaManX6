/// @description Insert description here
// You can write your code in this editor

action = 0;
alarm[0] = 1;

obj_player.image_alpha = 0;
global.music = "Level";

warp_y = 300;
warp_speed = 8;
warping_in = true;

character = "X";
x_colour = 0;
weapon = "Yanma Option"

blink = 0;
alarm[1] = 1;

particle_lines_alpha = 1;
particle_lines_colour = c_white;
portrait_x = -300;
for (var i = 0; i < 4; i++)
	portait_afterimage[i] = {x_pos : -300, move_speed : 0.02+(0.007*i),}; 

explaination_y = -350;
move_away = 0;

continue_fade = 0;
ending = false;

text_scrolling = 0;
text_counting = 0;

intro_bg = instance_create_layer(0,0,0,obj_background);
intro_bg.depth = layer_get_depth(layer_get_id("Explosions"));

//QWERTYUIOPASDFGHJKLZXCVBNM

//QPJKZXCVBM

//FROST TOWER
//GROUND HUNTER
//SOUL BODY
//AIMING LASER
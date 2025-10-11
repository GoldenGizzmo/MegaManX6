/// @description Insert description here
// You can write your code in this editor

//Camera/View
instance_create_layer(x,y,"Collision",obj_spawnzone);
instance_create_layer(x,y,"Collision",obj_camera);

global.animate = 0;
global.hud_toggle = false;
pal_swap_init_system(shd_pal_swapper,shd_pal_html_sprite,shd_pal_html_surface);

base_life = 32; //Starting max health
global.life = base_life;
global.lifemax = base_life;
life_tick = global.life;

global.death = false;
death_animation = 0;

global.music = "Off";

//Nightmare Souls Counter
souls_collected = 0; 
souls_timer = 0;
souls_alpha = 0;
souls_y_target = 125;
souls_y = souls_y_target;

//Particles
system = part_system_create();
part_system_depth(system,depth-1);

//Level starting
fade = instance_create_depth(obj_camera.x,obj_camera.y,0,obj_fade_in)
fade.fade_speed = 0.01;

spawning_start = false; //Slight delay to mechanics to allow everything to load in
alarm[1] = 30;

if room = rm_turtloid
{
	C1 = layer_get_id("Water");
	layer_script_begin(C1,scr_water_start);
	layer_script_end(C1,scr_water_end);
}
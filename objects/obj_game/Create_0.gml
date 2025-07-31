/// @description Insert description here
// You can write your code in this editor

//Camera/View
instance_create_layer(x,y,"Collision",obj_spawnzone);
instance_create_layer(x,y,"Collision",obj_camera);

global.animate = 0;
pal_swap_init_system(shd_pal_swapper,shd_pal_html_sprite,shd_pal_html_surface);

global.life = 20;
global.lifemax = global.life;
life_tick = global.life;

global.death = false;
death_animation = 0;

fade = instance_create_depth(obj_camera.x,obj_camera.y,0,obj_fade_in)
fade.fade_speed = 0.01;

//Particles
system = part_system_create();
part_system_depth(system,depth-1);




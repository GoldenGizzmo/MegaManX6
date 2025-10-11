/// @description Insert description here
// You can write your code in this editor

rain = instance_create_depth(0,0,0,obj_bullet_meteor_rain_charged);
rain.damage = bullet_damage_3;
rain.villainy = 2;
rain.rain_alpha = rain.rain_alpha_max;
rain.rain_active = true;

//Drawn as a surface with a shelter mechanic
rain.turtloid = true;
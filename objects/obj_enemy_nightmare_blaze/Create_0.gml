/// @description Insert description here
// You can write your code in this editor

event_inherited();

life = 12;
lifemax = life;
damage = 4;
damage_store = damage;
bullet_damage = 4;
bullet_damage_2 = 8;

state = choose("Shooting");
direction = point_direction(x,y,obj_camera.x,obj_camera.y);

action = 0;
alarm[0] = 30;

//Is a nightmare
nightmare = 1;

weight = 0;
colliding = false;

shoot = 0;
shoot_amount = 240;

aggro_range = 240;
revive_countdown = 0;









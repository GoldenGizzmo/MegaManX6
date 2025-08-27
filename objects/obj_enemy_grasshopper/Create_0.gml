/// @description Insert description here
// You can write your code in this editor

event_inherited();

life = 32;
lifemax = life;
damage = 8;
damage_store = 0;
bullet_damage = 6; //Blades
bullet_damage_2 = 3; //Larvae

drop_pickup = false;
weight = 0.2;

state = choose("Shooting","Spawning");
sprite_index = spr_enemy_grasshopper_idle;
explode = -1; //Prevents duplicate spawning (change if killed by it's weakness)

action = 0;
alarm[0] = 120;

shoot = 0;
shoot_max = 2;
spawn_max = 5;

//Is a nightmare
nightmare = 1;

palette = 0;
animation_ended = false;
revive_countdown = 0; 
flickering = 0;
flicker = false;

jet_anim_speed = 1;



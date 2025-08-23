/// @description Insert description here
// You can write your code in this editor

life = 10;
damage = 30;
resistance = 1;

isHit = false;
invul = false; //Whether enemy can be damaged
armour = false; //Blocked by most attacks

global.damage_taken = 999;
nightmare = 0; //Drops nightmare souls
nightmare_pickup = spr_pickup_soul_mid;

xspeed = 0;
yspeed = 0;
collision_list = ds_list_create();
weight = 0;
airborne = false;

death = 0; 
enemy_type = 0;
boss = false;
boss_iframes = -1;

spawn = 0;
despawn = true; //Variable to decide despawning
explode = 0; //Used for dying events
respawn = true; //Respawn after death
drop_pickup = true;

sprite_start = sprite_index;
image_index = 0;

camera_check = false;
event_user(3);








/// @description Insert description here
// You can write your code in this editor

event_inherited();

life = 10;
damage = 30;
resistance = 1;

isHit = false;
invul = false; //Whether enemy can be damaged
armour = false; //Blocked by most attacks

global.damage_taken = 999;
nightmare = 0; //Drops nightmare souls
nightmare_pickup = spr_pickup_soul_mid;

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

event_user(3);

airborne = false;
collision_list = ds_list_create()






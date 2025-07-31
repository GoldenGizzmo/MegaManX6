/// @description Insert description here
// You can write your code in this editor

life = 10;
damage = 30;
resistance = 1;

isHit = false;
invul = false; //Whether enemy can be damaged

global.damage_taken = 999;

xspeed = 0;
yspeed = 0;
weight = 0;
airborne = false;

death = 0; 
enemy_type = 0;

spawn = 0;
despawn = true; //Variable to decide despawning
explode = 0; //Used for dying events
respawn = true; //Respawn after death

camera_check = false;
event_user(3);







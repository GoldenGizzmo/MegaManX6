/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

life = 225; //Less health due to the jewel defense
lifemax = life;
damage = 6;
bullet_damage = 4; //Rockets
bullet_damage_2 = 5; //Bubbles
bullet_damage_3 = 1; //Giga

shoot = 1;
shoot_amount = 1;
attack_interrupt = 0;
raindrop = 1;
raindrop_amount = 4;
//done_stomp = false; //Cycle through these attacks

spinning = false;
rotate_speed = 0;
rotate = 0;
move_speed = 0;
bounce_height = 0;

weight = 0;
armour = true;

jewel_respawn_top = -1;
jewel_respawn_bottom = -1;
jewel_activated = false;

//Used for Giga Attack
zip_x = 0;
zip_y = 0;
done_giga = false;
giga_warning = 0;
giga_sprinkler = 0;
surface = noone;
/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

life = 150;
lifemax = life;
life_drone = 18;
damage = 0;
bullet_damage = 3; //Bullets
bullet_damage_2 = 5; //Explosives

colliding = false; //Airborne the whole time
weight = 0;

//Moves quickly to certain coordinates
zipping = false;
zip_x = 0;
zip_y = 0;
zip_speed = 0.25;

orbit_change = "No Change"

shoot = 0;
shoot_amount = 0;
shoot_repeat = 0;
summon_count = 3;
summon_state = 0;

animation_ended = false;
flicker = false;
wing_sound = true;
done_giga = false;
aim_direction = 0;
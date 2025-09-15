/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

life = 2;
bullet_damage = 2;
expiry = 60*20; //Last for 20 seconds

target = obj_player;
orbit = 30; // Orbit distance
orbit_angle = 0; // Current orbital angle
orbit_speed = 3; // Orbital speed
center_x = target.x; // x of orbital center
center_y = target.y; // y of orbital center
orbit_grow = 50;

flicker = false;
flicker_speed = 3;
iframes = 0;

shoot_delay = 0;
shoot_delay_max = 15;
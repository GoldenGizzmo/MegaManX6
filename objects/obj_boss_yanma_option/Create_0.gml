/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

life = 20;
lifemax = life;
damage = 0;
bullet_damage = 0;
bullet_damage_2 = 0;

weight = 0;
colliding = false;
movement_freeze = true;
drop_pickup = false;

despawn = false;
respawn = false;

target = obj_boss_yammark;
orbit = 30; // Orbit distance
orbit_angle = 0; // Current orbital angle
orbit_speed = 3; // Orbital speed
center_x = target.x; // x of orbital center
center_y = target.y; // y of orbital center
orbit_grow = 50;

follow = false;
invul = true;
order = 0;
aim = false;
aim_lock = false;


boss = true;
boss_flicker = false;
boss_flicker_speed = 4;
boss_iframes = 0;
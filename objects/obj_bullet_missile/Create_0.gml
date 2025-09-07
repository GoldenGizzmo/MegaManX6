/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

explosive = true;
explosion = spr_explosion_yanma;
explosion_sound = snd_explosion_large;

breakable = true;
phasing = true;

trail = spr_effect_smoke; //Creates a trail of smoke

target = 0;
target_x = 0;
target_y = 0;
target_offset = 0;

alarm[0] = 10;
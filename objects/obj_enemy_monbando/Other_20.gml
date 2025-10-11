/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x+40*image_xscale,y+20,"Projectiles",obj_bullet_wave)
bullet.spread_direction = image_xscale;
bullet.damage = bullet_damage;
bullet.villainy = 2;

shake = instance_create_depth(0,0,0,obj_shake);
shake.style = 1; //Vertical

scr_make_sound(snd_monbando_slam,1,1,false);
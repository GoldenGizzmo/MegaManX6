/// @description Insert description here
// You can write your code in this editor

bullet = instance_create_layer(x+44*image_xscale,y-10,"Projectiles",obj_bullet_monbando);
bullet.damage = bullet_damage;
bullet.villainy = 2;
bullet.speed = 2*image_xscale;
bullet.image_xscale = image_xscale;

bullet.owner = id;
bullet.target = obj_player;

scr_make_sound(snd_monbando_shoot,1,1,false);
/// @description Insert description here
// You can write your code in this editor
//+random_range(-50,50)
bullet = instance_create_layer(obj_player.x,obj_camera.y-150,"Projectiles",obj_bullet_default);
bullet.speed = 4;
bullet.direction = 270;

bullet.damage = bullet_damage;
bullet.sprite_index = spr_bullet_fireball;
bullet.explosion = spr_explosion_projectile;

bullet.afterimage_toggle = true;
bullet.afterimage_blend = c_purple;
bullet.afterimage_fade = 0.125;

bullet.villainy = 2;
bullet.phasing = true;

scr_make_sound(snd_shoot_fire,1,1,false);
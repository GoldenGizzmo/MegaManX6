/// @description Hand Blasts

bullet = instance_create_layer(x+(20*image_xscale),y-17,"Projectiles",obj_bullet_magma)
bullet.direction = point_direction(bullet.x,bullet.y,obj_player.x,obj_player.y)+(45*image_xscale)
bullet.speed = 3;
bullet.gravity = 0.15;

bullet.damage = bullet_damage;
bullet.villainy = 2;

scr_make_sound(snd_heatnix_shoot,1,1,false);
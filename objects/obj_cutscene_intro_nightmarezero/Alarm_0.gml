/// @description Insert description here
// You can write your code in this editor

switch (action)
{
	case 0: //Spawn nightmare again
		action++;
		alarm[0] = 60;
	
		//Spawn nightmare polter
		eye = instance_create_depth(d1000.x+70,d1000.y-80,depth+1,obj_enemy_nightmare_polter);
		eye.fade_in = true;
		eye.possess_target = obj_boss_d1000_corpse;
		eye.image_alpha = 0;
		eye.fade_away = 40;
		scr_make_sound(snd_polter_teleport,1,1,false);
		break;
		
	case 1: //Pick up D1000
		action++;
		alarm[0] = 1;
		
		with obj_boss_d1000_corpse
		{
			image_speed = 1;
			animation_ended = false;
		}
						
		scr_make_sound(snd_d1000_rise,1,1,false);
		obj_enemy_nightmare_polter.quiet = true;
		break;
				
	case 2: //Rising
		with obj_boss_d1000_corpse
		{
			if animation_ended = true
			{
				animation_ended = false;
						
				image_speed = 0;
				image_index = -1;
			}
		}
				
		//If below height
		if obj_boss_d1000_corpse.y > obj_boss_d1000_corpse.ystart-40
		{
			alarm[0] = 1;
						
			obj_boss_d1000_corpse.yspeed = -1; //Rise
			obj_boss_d1000_corpse.weight = 0;
		}
		else
		{
			action++;
			alarm[0] = 1;
						
			obj_boss_d1000_corpse.yspeed = 0;
						
			obj_boss_d1000_corpse.image_speed = -1;
			scr_make_sound(snd_d1000_shift,1,1,false);
		}
		break;
		
	case 3:
		if obj_boss_d1000_corpse.image_index > 0
			alarm[0] = 1;	
		else
		{
			obj_boss_d1000_corpse.image_speed = 0;
			obj_boss_d1000_corpse.image_index = 0;
						
			action++;
			alarm[0] = 30;
		}
		break;
		
	case 4:
		action++;
		alarm[0] = 10;
		
		conversation = instance_create_depth(0,0,0,obj_dialogue);
		conversation.dialogue = "X vs D1000 Ending";
		conversation.movement = false;
		break;
		
	case 5:
		if !instance_exists(obj_dialogue)
		{
			action++;
			alarm[0] = 30;
		}
		else
			alarm[0] = 1;
		break;

	case 6: //Nightmare zero spawns in
		action++;
		alarm[0] = 1;
		
		scr_make_sound(snd_player_zero_warp_in,1,1,false);
		nightmarezero = instance_create_layer(obj_player.x+50,1272,"Instances",obj_actor_nightmarezero)
		break;
		
	case 7:
		var check = false;
		alarm[0] = 1;
		
		with nightmarezero
		{
			if animation_ended = true
			{
				animation_ended = false;
				
				image_index = 0;
				sprite_index = spr_boss_nightmarezero_idle;
			
				check = true;
			}
		}
		
		if check = true
		{
			action++;
			alarm[0] = 30;
		}
		break;
		
	case 8: //Genmu
		action++;
		alarm[0] = 1;
	
		scr_make_sound(snd_nightmarezero_talk_die,1,1,false);
	
		with nightmarezero
		{
			animation_ended = false;
				
			image_index = 0;
			sprite_index = spr_boss_nightmarezero_genmu;
		}
		break;
		
	case 9: //Projectile
		alarm[0] = 1;
	
		if nightmarezero.image_index > 10
		{
			action++;
		
			with nightmarezero
			{
				bullet = instance_create_layer(x+(13*image_xscale),y-82,"Projectiles",obj_bullet_default);
				bullet.image_xscale = image_xscale;
				bullet.speed = 7*image_xscale;
				
				bullet.phasing = true;
				bullet.piercing = true;
				bullet.piercing_armour = true;
				bullet.sprite_index = spr_bullet_genmu;
			}
			
			scr_make_sound(snd_nightmarezero_sabershoot,1,1,false);
		}
		break;
		
	case 10:
		var check = false;
		alarm[0] = 1;
		
		with nightmarezero
		{
			if animation_ended = true
			{
				animation_ended = false;
				
				image_index = 0;
				sprite_index = spr_boss_nightmarezero_idle;
			
				check = true;
			}
		}
		
		if check = true
		{
			action++;
			alarm[0] = 120;
		}
		break;
		
	case 11: //Dash away after collecting all the nightmare souls
		action++;
		alarm[0] = 60;
		
		scr_make_sound(snd_player_zero_dash,1,1,false);
		
		with nightmarezero
		{
			sprite_index = spr_boss_nightmarezero_dash;
			hspeed = 4.5;
		}
		break;
		
	case 12: //X follows
		action++;
		alarm[0] = 60;
		break;
		
	case 13:
		action++;
		alarm[0] = 30;
		break;
		
	case 14:
		action++;
		alarm[0] = 10;
	
		conversation = instance_create_depth(0,0,0,obj_dialogue);
		conversation.dialogue = "X vs D1000 Ending 2";
		conversation.movement = false;
		break;
		
	case 15:
		if !instance_exists(obj_dialogue)
		{
			action++;
			alarm[0] = 30;
		}
		else
			alarm[0] = 1;
		break;
		
	case 16:
		instance_destroy(nightmarezero);
		with obj_player
			movement = true;
		with inst_3EA9F17
			y = 1088;
		with inst_7958612C
			instance_destroy();
		layer_set_visible(layer_get_id("Tileset_Destructible"),false);
		
		global.music = snd_music_haunted;
		obj_background.ambience = "Level";
		
		global.hud_toggle = true;
		instance_destroy();
		break;
}
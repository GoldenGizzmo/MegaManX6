/// @description Insert description here
// You can write your code in this editor

action = -1;
action_boss = 0;
action_ending = 0;
alarm[0] = 60;

instance_destroy(obj_fade_out);
fade = instance_create_depth(0,0,0,obj_fade_in);
fade.fade_speed = 0.01;

audio_stop_sound(global.music)
global.music = "Off"
scr_make_sound(snd_music_stage_start,1,1,false);

colour_fade = 0;
middle_fade = 0;
afterimage_appear = 200;

//Boss variables
scr_get_level(obj_menu_paused.menu_position)
sprite_index = boss_sprite;
boss_colour = character_colour;
boss_fadein = 1;

var scale = global.ui_scale/1.25; //Menu size
strand_move = 0; //Move into new position

//DNA strands
strand_big = instance_create_depth(display_get_gui_width()/2,0,0,obj_dna_strand);
strand_big.image_xscale = scale;
strand_big.image_yscale = scale;
strand_big.image_blend = boss_colour;

strand = instance_create_depth(10*scale,0,0,obj_dna_strand_small);
strand.image_xscale = scale;
strand.image_yscale = scale;
strand.image_blend = c_black;

strand_2 = instance_create_depth(display_get_gui_width()+(10*scale),0,0,obj_dna_strand_small);
strand_2.image_xscale = scale;
strand_2.image_yscale = scale;
strand_2.image_blend = c_white;

//Skip if level is completed
if global.level_completed = true
{
	action_ending = 2;
	audio_stop_sound(snd_music_stage_start);
}
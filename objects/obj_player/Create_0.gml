/// @description Insert description here
// You can write your code in this editor

event_inherited();

move_speed = 2;
jump_height = 6.5; //4.5

dash = false;
dash_speed = 4.5;
dash_length = 30; 
dash_ground = false;
fall_speed = 6;
movement = false;
underwater = false;

//zipline = false;
climbing_dismount = false;
climbing = false;
wall_jump = false;
wall_slide = false;
crouch = false;

//Health
recovery = 0;
base_recovery_time = 70;
recovery_time = base_recovery_time;
hurt = false
damage_taken = 999;
set_knockback = 1.5;
knockback = set_knockback;
flicker = false;
invul = false;
weight = 0.3;

//Special attack
attack_action = attack_actions.none;
attack_priority = 0; //Determines if it can be cancelled by moving or dash

changing_sprite = noone;
animation_lock = true; //Stop using gravity when openning a door
camera_lasttouch = noone;

shooting = 0;
shooting_charged = false;
shooting_lock = false;
shooting_charge = 0;
shooting_charge_flicker = false;
shooting_charge_lvl_1 = 30;
shooting_charge_lvl_2 = 90;

shot_fired = false;

palette = 0;
flicker_weapon_swap = false;

slowed = 0;

//Air Dash
airdash_lock = false; //Prevent being used twice in mid-air
airdash_state = 0; //Stage of the airdash
//Mach dash
machdash_hold = 0;
machdash_holdmax = 30;
machdash_direction = 0;
machdash_damage = 2;

on_slope = false;

depth -= 10; //Draw above other enemies


stop_player = false;


spr_manager = new sprite_manager(id)

scr_setup_player_sprites()
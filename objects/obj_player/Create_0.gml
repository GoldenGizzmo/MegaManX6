/// @description Insert description here
// You can write your code in this editor

airborne = false
move_speed = 2;
jump_height = 6.5; //4.5
xspeed = 0;
yspeed = 0;

dash = false;
dash_speed = 4.5;
dash_length = 30; 
dash_ground = false;
weight = 0.3;
fall_speed = 6;
movement = true;
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
invincible = true;

//Special attack
attack_action = 0;
attack_priority = 0; //Determines if it can be cancelled by moving or dash

changing_sprite = noone;
animation_lock = false; //Stop using gravity when openning a door
camera_lasttouch = noone;

shooting = false;
shooting_lock = false;
shooting_charge = 0;
shooting_charge_flicker = false;
shooting_charge_lvl_1 = 30;
shooting_charge_lvl_2 = 80;

palette = 1;
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


collision_list = ds_list_create();
on_slope = false;

depth -= 10; //Draw above other enemies






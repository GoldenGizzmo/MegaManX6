/// @description Insert description here
// You can write your code in this editor

if boss_flicker = true
{
	//gpu_set_fog(true,c_ltgrey,0,0);
	draw_sprite_ext(sprite_index,image_index,x,y,1,image_yscale,0,image_blend,image_alpha);
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sprite_index,image_index,x,y,1,image_yscale,0,image_blend,image_alpha);
	gpu_set_blendmode(bm_normal)
	//gpu_set_fog(false,c_ltgrey,0,0);
}
else
	draw_sprite_ext(sprite_index,image_index,x,y,1,image_yscale,0,image_blend,image_alpha);

var jet_x = 0;
var jet_y = 0;
switch (direction)
{
	case 0: //Moving right
		jet_x = -69;
		jet_y = -10;
		break; 
	case 90:  //Moving up
		jet_x = -30;
		jet_y = 64;
		break; 
	case 180: //Moving left
		jet_x = 66;
		jet_y = -1;
		break; 
	case 270: //Moving down
		jet_x = 0;
		jet_y = -60;
		break; 
}

if life > 0 and !(xspeed = 0 and yspeed = 0)
	draw_sprite_ext(spr_boss_donut_jets,global.animate/2,x+jet_x,y+jet_y,1,1,direction,c_white,1);
	
//draw_text(obj_player.x,obj_player.y-50,action)
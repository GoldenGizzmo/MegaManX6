// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_sprite_line(x1, y1, x2, y2, sprite, subimage, segments, offset){
/// @param  x1                      (x pos of first line point)
/// @param  y1                      (y pos of first line point)
/// @param  x2                      (x pos of second line point)
/// @param  y2                      (y pos of second line point)
/// @param  sprite                  (sprite to use)
/// @param  subimage                (subimage to use)
/// @param  segments                (number of sprite segments that make up the line)
/// @param  offset                  (this increments the image_index by X amount after each segment is drawn, useful for certain things)
 
//by pringle :)
 
var dis         = point_distance( argument0, argument1, argument2, argument3);
var dir         = point_direction(argument0, argument1, argument2, argument3);
var spr_id      = argument4
var spr_sub     = argument5
var spr_num     = argument6
 
var i;
for (i = 0; i < spr_num; i += 1)
   draw_sprite(spr_id, spr_sub + (i * argument7), argument0 + lengthdir_x((dis / spr_num) * i, dir), argument1 + lengthdir_y((dis / spr_num)*i, dir))
}
	
function scr_draw_sprite_line_ext(x1, y1, x2, y2, sprite, subimage, segments, offset, scale, rotation, colour, alpha){
/// @param  x1                      (x pos of first line point)
/// @param  y1                      (y pos of first line point)
/// @param  x2                      (x pos of second line point)
/// @param  y2                      (y pos of second line point)
/// @param  sprite                  (sprite to use)
/// @param  subimage                (subimage to use)
/// @param  segments                (number of sprite segments that make up the line)
/// @param  offset                  (this increments the image_index by X amount after each segment is drawn, useful for certain things)
 
//by pringle :)
 
var dis         = point_distance( argument0, argument1, argument2, argument3);
var dir         = point_direction(argument0, argument1, argument2, argument3);
var spr_id      = argument4
var spr_sub     = argument5
var spr_num     = argument6
 
var i;
for (i = 0; i < spr_num; i += 1)
   draw_sprite_ext(spr_id, spr_sub + (i * argument7), argument0 + lengthdir_x((dis / spr_num) * i, dir), argument1 + lengthdir_y((dis / spr_num)*i, dir),scale,scale,rotation,colour,alpha);
}
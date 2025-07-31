/// @description Insert description here
// You can write your code in this editor

global.view_width = 1920/zoom_scale;
global.view_height = 1080/zoom_scale;

window_set_size((resolution_width/4)*window_scale,(resolution_height/4)*window_scale);
surface_resize(application_surface,global.view_width*window_scale,global.view_height*window_scale);
if window_scale < 4
	display_set_gui_size(display_get_width(),display_get_height());
else
	display_set_gui_size((resolution_width/4)*window_scale,(resolution_height/4)*window_scale);




















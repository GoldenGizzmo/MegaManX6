///@func app_surface_draw_filtered(surface, upscale_method)
function app_surface_draw_filtered(_surface = application_surface, _upscale_method = Upscale_Method.bicubic){
  
  var _surfWidth = surface_get_width(_surface), 
      _surfHeight = surface_get_height(_surface), 
      _winWidth = window_get_width(), 
      _winHeight = window_get_height();      
  
  var _scale = min(_winWidth / _surfWidth, _winHeight / _surfHeight);
  
  better_scaling_draw_surface(_surface,  _winWidth/2 - _surfWidth * _scale * .5,  _winHeight/2 - _surfHeight * _scale * .5, _scale, _scale, 0, c_white, 1, _upscale_method)
}
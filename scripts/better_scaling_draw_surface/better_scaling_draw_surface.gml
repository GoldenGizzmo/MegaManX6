///@func better_scaling_draw_surface(id, x, y, xscale, yscale, rot, colour, alpha, upscale method)
// Like draw_surface_ext, but with better scaling.
// id, x, y, xscale, yscale, rot, colour, alpha: See draw_surface_ext in the manual for information on these parameters.
// upscale method: 0: No upscale shader. 1: Bicubic upscale shader. 2: hq4x depixelization (full alpha support, but more jaggy than 5xbr).
//                 3: 5xbra depixelization (round). 4: 5xbrb depixelization (semi-round). 5: 5xbrc depixelization (square).
//                 5xbr does not have full alpha support, but below you can set a color to act as transparency.
// What is meant by better scaling is that images with a scale larger than one will be depixelized or bicubically interpolated while images with a scale smaller than one will be supersampled.
// Depixelization here follows the hqnx and xbr methods, which looks at patterns in an image and tries to vectorize them. Making e.g. square dots next to each other turn into lines.
// Bicubic interpolation looks at the 16 surrounding pixels to mathematically determine a smooth transition between pixels that are being scaled.
// Supersampling is a downscaling technique that takes the average color over regions of the original image. So downscaling by n, will average a portion of nxn pixels from the original image into 1 for the render target.
function better_scaling_draw_surface(_id, _x, _y, _xscale, _yscale, _rot, _color, _alpha, _upscale_method) {
  var scale_up = ((_xscale > 1 || _yscale > 1) && _upscale_method != 0),
    scale_down = (_xscale < 1 || _yscale < 1);
  var filtered = gpu_get_tex_filter();
  if (scale_up) {
    switch (_upscale_method) {
      case Upscale_Method.bilinear:
        shader_set(sh_better_scaling_bilinear);
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_bilinear, "bitmap_width"), surface_get_width(_id));
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_bilinear, "bitmap_height"), surface_get_height(_id));
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_bilinear, "x_scale"), _xscale)
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_bilinear, "y_scale"), _yscale); 
      break;
      
      case Upscale_Method.bicubic:
        shader_set(sh_better_scaling_bicubic);
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_bicubic, "texel_size"), 1 / surface_get_width(_id), 1 / surface_get_height(_id));
        gpu_set_tex_filter(true);
      break;
      
      case Upscale_Method.hq4x:
        shader_set(sh_better_scaling_hq4x);
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_hq4x, "texel_size"), 1 / surface_get_width(_id), 1 / surface_get_height(_id));
        gpu_set_tex_filter(false);
      break;
      
      case Upscale_Method.xbra:
        shader_set(sh_better_scaling_5xbra);
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_5xbra, "texel_size"), 1 / surface_get_width(_id), 1 / surface_get_height(_id));
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_5xbra, "texture_size"), surface_get_width(_id), surface_get_height(_id));
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_5xbra, "color"), color_get_red(_color) / 255, color_get_green(_color) / 255, color_get_blue(_color) / 255, _alpha);
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_5xbra, "color_to_make_transparent"), -1, -1, -1); // Channels from 0 to 1 for the RGB color you want to make transparent. -1 means disabled.
        gpu_set_tex_filter(false);
      break;
      
      case Upscale_Method.xbrb:
        shader_set(sh_better_scaling_5xbrb);
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_5xbrb, "texel_size"), 1 / surface_get_width(_id), 1 / surface_get_height(_id));
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_5xbrb, "texture_size"), surface_get_width(_id), surface_get_height(_id));
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_5xbrb, "color"), color_get_red(_color) / 255, color_get_green(_color) / 255, color_get_blue(_color) / 255, _alpha);
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_5xbrb, "color_to_make_transparent"), -1, -1, -1); // Channels from 0 to 1 for the RGB color you want to make transparent. -1 means disabled.
        gpu_set_tex_filter(false);
      break;
      
      case Upscale_Method.xbrc:
        shader_set(sh_better_scaling_5xbrc);
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_5xbrc, "texel_size"), 1 / surface_get_width(_id), 1 / surface_get_height(_id));
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_5xbrc, "texture_size"), surface_get_width(_id), surface_get_height(_id));
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_5xbrc, "color"), color_get_red(_color) / 255, color_get_green(_color) / 255, color_get_blue(_color) / 255, _alpha);
        shader_set_uniform_f(shader_get_uniform(sh_better_scaling_5xbrc, "color_to_make_transparent"), -1, -1, -1); // Channels from 0 to 1 for the RGB color you want to make transparent. -1 means disabled.
        gpu_set_tex_filter(false);
      break;
    }
  } else if (scale_down) {
    var width, height, samples_x, samples_y, max_samples, offset_x, offset_y;
    width = surface_get_width(_id);
    height = surface_get_height(_id);
    samples_x = _xscale == 0 ? width : min(width, 1 / _xscale);
    samples_y = _yscale == 0 ? height : min(height, 1 / _yscale);
    max_samples = max(samples_x, samples_y);
    offset_x = (1 / width) * samples_x * 0.5;
    offset_y = (1 / height) * samples_y * 0.5;
    
    if (max_samples <= 2) {
      shader_set(sh_better_scaling_supersampling_2x2);
      shader_set_uniform_f(shader_get_uniform(sh_better_scaling_supersampling_2x2, "offset"), offset_x, offset_y);
    } else if (max_samples <= 3) {
      shader_set(sh_better_scaling_supersampling_3x3);
      shader_set_uniform_f(shader_get_uniform(sh_better_scaling_supersampling_3x3, "offset"), offset_x, offset_y);
    } else {
      shader_set(sh_better_scaling_supersampling_4x4);
      shader_set_uniform_f(shader_get_uniform(sh_better_scaling_supersampling_4x4, "offset"), offset_x, offset_y);
    }
  }
  
  draw_surface_ext(_id, _x, _y, _xscale, _yscale, _rot, _color, _alpha);
  
  if (scale_up || scale_down) {
    shader_reset();
  }
  
  gpu_set_tex_filter(filtered)
}

enum Upscale_Method {
  none,
  bilinear, 
  bicubic,
  hq4x,
  xbra,
  xbrb,
  xbrc
}
var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);

var _p1 = 1;
var _p2 = 1;
draw_sprite_tiled(spr_crimson_background_sky,0,_camx * _p2,_camy);
draw_sprite_tiled(spr_crimson_background,0,_camx * _p1,_camy);

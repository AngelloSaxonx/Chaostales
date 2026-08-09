var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);

var _p0 = 1;
var _pa = 1;
var _pb = 1.5;
draw_sprite_tiled(spr_scarlet_background_0,0,_camx * _p0,_camy);
draw_sprite_tiled(spr_scarlet_background_a,0,_camx * _pa,_camy);
draw_sprite_tiled(spr_scarlet_background_b,0,_camx * _pb,_camy);
draw_sprite_tiled(spr_scarlet_background_c,0,_camx = _pb,_camy);

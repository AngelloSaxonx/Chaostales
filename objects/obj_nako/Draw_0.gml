
if (from != noone)
{
	image_moving += sprite_get_speed(attack_spr[0])/60
	draw_sprite_part_ext(sprite_index, image_index,0,34,40,6,x-(20*image_xscale),y-6,image_xscale, image_yscale, image_blend, image_alpha)
	draw_sprite_part_ext(attack_spr[1], image_moving,0,0,40,34,x-(20*image_xscale),y-40,image_xscale, image_yscale, image_blend, image_alpha)
	draw_sprite_ext(attack_spr[3], image_index+4,x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	draw_sprite_ext(attack_spr[2], image_moving,x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
}
else
{
	draw_self()
}

if (from == noone)
{
	image_moving = 0;
}



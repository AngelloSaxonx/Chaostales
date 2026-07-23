if (abs(xspd != 0)) && (from != noone) && (state != scr_wall_recovery)
{
	/*image_moving += sprite_get_speed(attack_spr[0])/60
	draw_sprite_part_ext(sprite_index, image_index,0,34,40,6,x-(20*face),y-6,image_xscale*face, image_yscale, image_blend, image_alpha)
	draw_sprite_ext(attack_spr[2], image_moving,x, y, image_xscale*face, image_yscale, image_angle, image_blend, image_alpha)
	draw_sprite_part_ext(attack_spr[1], image_moving,0,0,40,34,x-(20*face),y-40,image_xscale*face, image_yscale, image_blend, image_alpha)*/
	image_moving += sprite_get_speed(attack_spr[0])/60
	if (!on_ground)
	{
	jump_animation_for_player()
	}
	else
	{
		if (sprite_index != run_spr)
		{
		draw_sprite_part_ext(sprite_index, image_index,0,34,40,6,x-(20*face),y-6,image_xscale*face, image_yscale, image_blend, image_alpha)
		draw_sprite_part_ext(attack_spr[1], image_moving,0,0,40,34,x-(20*face),y-40,image_xscale*face, image_yscale, image_blend, image_alpha)
		draw_sprite_ext(attack_spr[2], image_moving,x, y, image_xscale*face, image_yscale, image_angle, image_blend, image_alpha)
		draw_sprite_ext(attack_spr[3], image_index+2,x, y, image_xscale*face, image_yscale, image_angle, image_blend, image_alpha)
		}
		else
		{
		draw_sprite_part_ext(sprite_index, image_index,0,34,40,6,x-(20*face),y-6,image_xscale*face, image_yscale, image_blend, image_alpha)
		draw_sprite_part_ext(attack_spr[1], image_moving,0,0,40,34,x-(20*face),y-40,image_xscale*face, image_yscale, image_blend, image_alpha)
		draw_sprite_ext(attack_spr[2], image_moving,x, y, image_xscale*face, image_yscale, image_angle, image_blend, image_alpha)
		draw_sprite_ext(attack_spr[3], image_index+6,x, y-1, image_xscale*face, image_yscale, image_angle, image_blend, image_alpha)
		}
	}
}
else if (abs(xspd == 0)) && (from != noone) && (!on_ground)
{
	jump_animation_for_player()
}
else
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale*face, image_yscale, image_angle, image_blend, image_alpha)
}

if (from == noone)
{
	image_moving = 0;
	condition_frame = 0;
}
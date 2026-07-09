function jump_animation_for_player(){
image_moving += sprite_get_speed(attack_spr[0])/60
	draw_sprite_part_ext(sprite_index, image_index,13,30,12,10,x-(7*face),y-9,image_xscale*face, image_yscale, image_blend, image_alpha)
	draw_sprite_part_ext(attack_spr[1],image_moving,0,0,40,32,x-(20*face),y-40,image_xscale*face, image_yscale, image_blend, image_alpha)
	if (image_index >= 2) {condition_frame = 1} else {condition_frame = 0}
	draw_sprite_ext(attack_spr[3], condition_frame,x, y, image_xscale*face, image_yscale, image_angle, image_blend, image_alpha)
	draw_sprite_ext(attack_spr[2], image_moving,x, y, image_xscale*face, image_yscale, image_angle, image_blend, image_alpha)
}
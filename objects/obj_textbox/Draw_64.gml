draw_sprite_stretched(text_sprite, 0, x, y, width, height);

var _draw_text_x = x;
var _draw_text_y = y;
var _draw_text_width = text_width;

var _finished = (text_progress == text_length);

if (sprite_exists(portrait_sprite))
{
	_draw_text_width -= portrait_width + portrait_x + padding;
	
	var _draw_portrait_x = x + portrait_x;
	var _draw_portrait_y = y + portrait_y;
	var _draw_portrait_xscale = 1;
	
	if (portrait_side == PORTRAIT_SIDE.LEFT)
	{
		_draw_text_x += portrait_width + portrait_x + padding;
	}
	else
	{
		_draw_portrait_x = x + width + portrait_width - portrait_x;
		_draw_portrait_xscale= -1;
	}
	
	
	var _subming = 0;
	if (!_finished)
		_subming = (text_progress / text_speed) * (sprite_get_speed(portrait_side) / game_get_speed(gamespeed_fps));
		
	draw_sprite_ext(portrait_sprite, _subming, _draw_portrait_x + portrait_width / 2 - 3, _draw_portrait_y + portrait_height / 2 - 3, _draw_portrait_xscale, 1, 0, #ffffff, 1);
	
}

if speaker_name != ""
{
	var  _name_w = max(string_width(speaker_name), speaker_width);
	
	draw_sprite_stretched(text_sprite, 0, x + speaker_x / 2 - 3, y + speaker_y - speaker_height, _name_w, speaker_height)
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(speaker_font);
	draw_set_color(speaker_color)
	draw_text(x + speaker_y + _name_w / 2, y + speaker_y - 14, speaker_name);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(text_font);
draw_set_color(text_color);
scr_type(_draw_text_x + text_x, _draw_text_y + text_y, text, text_progress, _draw_text_width);
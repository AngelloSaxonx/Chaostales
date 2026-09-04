/////Draw textboard
draw_sprite_stretched(text_sprite, 0, x, y, width, height);
/////Those two added before speed was truly assgin
//Delay text
for (var s = 0; s < array_length(start_speed); s++) {
	if (text_progress >= start_speed[s]-1 && text_progress <= start_speed[s]-1) 
	&& (text_speed != 0){
		text_speed = 0
		alarm[0] = delayed_text[s]
	}
}
//Slow or fast text
if (alarm[0] < 0)
{
	for (var s = 0; s < array_length(start_speed); s++) {
		if (text_progress >= start_speed[s]-1 && text_progress <= end_speed[s]) {
			text_speed = speed_text[s]
		}
		else
		{
			if (s == array_length(start_speed)-1) && (text_progress > end_speed[s])
			{text_speed = 1}
		}
	}
}
/////Draw text
//variable
var _draw_text_x = x;
var _draw_text_y = y;
var _draw_text_width = text_width;

var _finished = (text_progress == text_length);
//Draw picture
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
		_subming = (text_progress / text_speed) * (sprite_get_speed(portrait_sprite) / game_get_speed(gamespeed_fps));
		
	draw_sprite_ext(portrait_sprite, _subming, _draw_portrait_x + portrait_width / 2 - 2, _draw_portrait_y + portrait_height / 2 - 2, _draw_portrait_xscale, 1, 0, #ffffff, 1);
	
}
//if no picture, draw text normally.
if speaker_name != ""
{
	var  _name_w = max(string_width(speaker_name), speaker_width);
	
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(speaker_font);
	draw_set_color(speaker_color)
	draw_text(x + speaker_x + _name_w / 2, y + speaker_y / 2, speaker_name);
}
//Assgin
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(text_font);

scr_type(_draw_text_x + text_x, _draw_text_y + text_y, text, text_progress, _draw_text_width, 
text_color, sub_text_color);
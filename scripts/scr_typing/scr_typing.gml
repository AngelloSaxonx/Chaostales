function scr_start_cutscene(_cutscene)
{
	if (instance_exists(obj_textbox))
	return;
	
	var _inst = instance_create_depth( x, y, -999, obj_textbox);
	_inst.start_cutscene(_cutscene);
}

function scr_type( x, y, _text, _progress, _width, c_color1, c_color2, _start, _end)
{
	var _draw_x = 0;
	var _draw_y = 0;
	
	for (var _i = 1; _i <= _progress;_i++)
	{
		var _char = string_char_at(_text, _i);
		
		if (_char == "\n")
		{
			_draw_x = 0;
			_draw_y += string_height("A");
		}
		else if (_char == " ")
		{
			_draw_x += string_width(_char);
			
			var _word_width = 0;
			for (var _ii = _i + 1; _ii <= string_length(_text); _ii++)
			{
				var _word_char = string_char_at(_text, _ii)
				
				if (_word_char == "\n" || _word_char == " ")
				break;
				
				_word_width += string_width(_word_char);
				if (_draw_x + _word_width > _width)
				{
					_draw_x = 0;
					_draw_y += string_height("A");
					break;
				}
			}
		}
		else//page = current_action // draw_char = text_progress
		{
			var move_x = 0;
			var move_y = 0;
			var current_color = c_color1; 
		    for (var k = 0; k < array_length(_start); k++) {
		        if (_i >= _start[k] && _i <= _end[k]) {
		            current_color = c_color2[k];
					if (effect_text[k] = 1)
					{
						float_dir[_i] -= 6
						move_y = dsin(float_dir[_i])*1
					}
					else if (effect_text[k] = 2)
					{
						shake_timer[_i]--;
						if (shake_timer[_i] <= 0)
						{
							shake_timer[_i] = irandom(4)
							shake_dir[_i] = irandom_range(0,359)
						}
						if (shake_timer[_i] <= 2)
						{
							move_x = lengthdir_x(1,shake_dir[_i])
							move_y = lengthdir_y(1,shake_dir[_i])
						}
					}
		        }
		    }
			draw_text_color(x + _draw_x+ move_x,y + _draw_y+move_y, _char,current_color,current_color,current_color,current_color,1);
			
			//draw_text_custom(x + _draw_x, y +_draw_y,_char,c_white,c_red,1,5,_i)
			_draw_x += string_width(_char);
		}
	}
}
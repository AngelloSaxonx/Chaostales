function scr_actions() constructor
{
	act = function() {};
}

function scr_text(_text,_color,effect_on,_startE,_endE,_spd,_time,_startS,_endS) : scr_actions() constructor
{
	text = _text;
	sub_text_color = _color;
	effect_text = effect_on
	start_effect = _startE;
	end_effect = _endE;
	speed_text = _spd;
	delayed_text = _time;
	start_speed = _startS;
	end_speed = _endS;
	act = function(_textbox)
	{
		_textbox.set_text(text,sub_text_color,effect_text,start_effect,end_effect,speed_text,delayed_text,start_speed,end_speed);
	}
}


function scr_speaker(_sprite = undefined, _portrait = undefined, _side = undefined) : scr_actions() constructor
{
	sprite = _sprite;
	portrait = _portrait;
	side = _side;
	
	act = function(_textbox)
	{
		if !is_undefined(sprite)
			_textbox.text_sprite = sprite;
		
		if !is_undefined(portrait)
			_textbox.portrait_sprite = portrait;
		
		if !is_undefined(side)
			_textbox.portrait_side = side;
		
		_textbox.next();
	}
}

function scr_transition(_target_x, _target_y, _target_rm) : scr_actions() constructor
{
	var _transition = instance_create_depth(0,0,-9999,obj_transition)
	_transition.target_rm = _target_rm;
	_transition.target_x = _target_x;
	_transition.target_y = _target_y;
}
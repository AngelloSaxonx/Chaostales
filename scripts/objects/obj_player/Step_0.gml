switch (state)
{
	//Idle
	case scr_state_azure.idle:
	{
	if (inner_state) == 0
	{
		inner_state = 1;
		sprite_index = spr_azure_idle;
	}
	if (inner_state) == 1
	{
		var _move_h = keyboard_check(vk_right) - keyboard_check(vk_left);
		if !scr_on_ground()
			scr_change_state(scr_state_azure.fall);
		else if keyboard_check_pressed(ord("Z"))
			scr_change_state(scr_state_azure.jump);
		else if (abs(_move_h) > 0)
			scr_change_state(scr_state_azure.walk);
	}
	if (inner_state) == 2
	{
		state = next_state
		inner_state = 0
	}
	}
	break;
	
	//Walk
	case scr_state_azure.walk:
	{
	if (inner_state) == 0
	{
		inner_state = 1;
		sprite_index = spr_azure_walk;
	}
	if (inner_state) == 1
	{
		var _move_h = keyboard_check(vk_right) - keyboard_check(vk_left);
		xspd = _move_h * move_spd;
		if (_move_h != 0)
			image_xscale = sign(_move_h);
		if !scr_on_ground()
			scr_change_state(scr_state_azure.fall);
		else if keyboard_check_pressed(ord("Z"))
			scr_change_state(scr_state_azure.jump);
		else if (_move_h == 0)
			scr_change_state(scr_state_azure.idle);
	}
	if (inner_state) == 2
	{
		state = next_state
		inner_state = 0
	}
	}
	break;
	
	//Jump
	case scr_state_azure.jump:
	{
	if (inner_state) == 0
	{
		inner_state = 1;
		sprite_index = spr_azure_jump;
		image_index = 0
		yspd += jump_strength;
	}
	if (inner_state) == 1
	{
		var _move_h = keyboard_check(vk_right) - keyboard_check(vk_left);
		xspd = _move_h * move_spd;
		if (_move_h != 0)
			image_xscale = sign(_move_h);
		if (yspd >= 0)
			scr_change_state(scr_state_azure.fall);
	}
	if (inner_state) == 2
	{
		state = next_state
		inner_state = 0
	}
	}
	break;
	
	//Fall
	case scr_state_azure.fall:
	{
	if (inner_state) == 0
	{
		inner_state = 1;
		sprite_index = spr_azure_fall;
		image_index = 0
	}
	if (inner_state) == 1
	{
		var _move_h = keyboard_check(vk_right) - keyboard_check(vk_left);
		xspd = _move_h * move_spd;
		if (_move_h != 0)
			image_xscale = sign(_move_h);
		if scr_on_ground()
			scr_change_state(scr_state_azure.idle);
	}
	if (inner_state) == 2
	{
		state = next_state
		inner_state = 0
	}
	}
}
scr_update_movement();

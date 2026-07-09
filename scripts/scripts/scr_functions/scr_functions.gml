function scr_contol_setup()
{
	buffer_time = 30;
	jump_key_buffered = 0;
	jump_key_buffer_timer = 0;
}

function scr_get_control()
{
	right_key = keyboard_check(vk_right) + gamepad_button_check( 0, gp_padr);
		right_key = clamp( right_key, 0, 1);
	left_key = keyboard_check(vk_left) + gamepad_button_check( 0, gp_padl);
		left_key = clamp( left_key, 0, 1);
	down_key = keyboard_check(vk_down) + gamepad_button_check( 0, gp_padd)
		down_key = clamp( down_key, 0, 1)
	down_key_pressed = keyboard_check_pressed(vk_down) + gamepad_button_check_pressed( 0, gp_padd)
		down_key_pressed = clamp( down_key_pressed, 0, 1)
		
	jump_key_pressed = keyboard_check_pressed(ord("Z")) + gamepad_button_check_pressed( 0, gp_face1);
		jump_key_pressed = clamp( jump_key_pressed, 0, 1);
	jump_key = keyboard_check(ord("Z")) + gamepad_button_check( 0, gp_face1);
		jump_key = clamp( jump_key, 0, 1);
	
	dash_key = keyboard_check_pressed(ord("C")) + gamepad_button_check_pressed( 0, gp_shoulderlb);
		dash_key = clamp( dash_key, 0, 1);
	run_key = keyboard_check(ord("C")) + gamepad_button_check( 0, gp_shoulderlb);
		run_key = clamp( run_key, 0, 1);
		
	if jump_key_pressed
	{
		jump_key_buffer_timer = buffer_time;
		
	}
	
	if jump_key_buffer_timer > 0
	{
		jump_key_buffered = 1;
		jump_key_buffer_timer--;
	}
	else
	{
		jump_key_buffered = 0;
	}
		
}
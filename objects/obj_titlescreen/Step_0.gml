scr_menu_control()
pos += down_key - up_key;
if pos >= option_lenght {pos = 0};
if pos < 0 {pos = option_lenght-1};

if accept_key
{
	switch(pos)
	{
		case(0):
		room_goto(rm_weird_fields_1);
		
		break;
		
		
		case(5):
		game_end();
		break;
		
	}
}
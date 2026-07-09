scr_menu_control();
text_progress = min(text_progress + text_speed, text_length);

if (text_progress == text_length)
{
	if accept_key
	{
		next();
	}
}
else if cancel_key
{
	text_progress = text_length
}
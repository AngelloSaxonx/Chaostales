//Position
x_margin = 5;
y_margin = 85;
padding = 8;
width =	display_get_gui_width() - x_margin * 2;
height = display_get_gui_height() - y_margin * 2;

x = (display_get_gui_width() - width) / 2;
y = display_get_gui_height() - height - x_margin;

//Text
text_sprite = spr_textbox_classic;
text_font = global.classic_font;
text_color = #ffffff;
text_speed = 1;
text_x = padding + 1;
text_y = padding - 10;
text_width = width - padding*2;

//Portrait
portrait_x = padding;
portrait_y = padding;

//Character
speaker_x = padding;
speaker_y = 0;
speaker_font = global.classic_font
speaker_color = #ff0000

//Actions
actions = [];
current_action = -1;

//DO NOT EDIT!!
text = "";
text_progress = 0;
text_length = 0;

portrait_sprite = -1;
background_sprite = spr_textbox_background;
portrait_width = sprite_get_width(spr_textbox_background);
portrait_height = sprite_get_height(spr_textbox_background);
portrait_side = PORTRAIT_SIDE.LEFT;

enum PORTRAIT_SIDE
{
	LEFT,
	RIGHT
}

speaker_name = "";
speaker_width = sprite_get_width((spr_textbox_name));
speaker_height = sprite_get_height(spr_textbox_name);
speaker_font = global.classic_font;
speaker_color = #ffffff;
//Cutscene Methods
start_cutscene = function(_cutscene)
{
	actions = global.cutscenes[$ _cutscene]
	current_action = -1;
	
	next();
}

next = function()
{
	current_action++;
	if (current_action >= array_length(actions))
	{
		instance_destroy();
	}
	else
	{
		actions[current_action].act(id)
	}
	
}

set_text = function(_set_text)
{
	text = _set_text;
	text_length = string_length(_set_text);
	text_progress = 0;
}
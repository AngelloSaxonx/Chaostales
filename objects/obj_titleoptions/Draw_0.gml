
x = option_x;
y = option_y;

draw_set_font(global.classic_font);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
for (var i = 0; i < option_lenght; i++)
{
	var c = #ffffff;
	if pos = i {c = #ff0000};
	draw_text_color(x+option_border, y+option_border + option_space*i, option[i], c, c, c, c, 1);
}


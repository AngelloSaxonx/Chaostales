//draw
if room != rm_titlescreen
{
	// code here
	draw_sprite(hp_spr,0,Xoffset * space, Yoffset)
	draw_sprite(char_spr,0,Xoffset * space + 24, Yoffset)
	draw_text(Xoffset * space + 34, Yoffset, "hp:" + string(hp) + "/" + string(hp_max))
	draw_text(Xoffset * space + 34, Yoffset + 20, "en:" + string(en) + "/" + string(en_max))
}
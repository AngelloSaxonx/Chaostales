//draw
if room != rm_titlescreen
{
	// code here
	draw_sprite(hp_spr,0,Xoffset * space, Yoffset*2)
	draw_sprite(en_spr,0,Xoffset * space, Yoffset*4)
	draw_sprite(char_spr,0,Xoffset * (space/2), Yoffset*2)
	draw_text(Xoffset * space + 20, Yoffset*2, "hp:" + string(hp) + "/" + string(hp_max))
	draw_text(Xoffset * space + 20, Yoffset*4, "en:" + string(en) + "/" + string(en_max))
}
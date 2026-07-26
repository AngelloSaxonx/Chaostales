/*draw_self()
if (nearest2 != noone)
{
	draw_line(nearest2.LPoint,nearest2.YPoint,RPoint,YPoint)
	draw_text(x,y,point_direction(nearest2.LPoint, nearest2.YPoint, RPoint, YPoint))
	draw_circle(nearest2.bbox_right,nearest2.y,5,true)
	draw_circle(RPoint,y-10,5,true)
}

/*if (nearest != noone)
{
	draw_line(nearest.RPoint,nearest.YPoint,LPoint,YPoint)
	draw_text(x,y,point_direction(nearest.RPoint, nearest.YPoint, LPoint, YPoint))
	draw_circle(nearest.bbox_right,nearest.y,5,true)
	draw_circle(LPoint,y-10,5,true)
}
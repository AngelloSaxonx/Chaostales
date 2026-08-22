//step

//  Pathing & Finding & Movement //
#region

var offsetY = 0;
if instance_place(x,y+1,obj_collision)
{offsetY = 1;}

var offsetTargetY = 0;
if instance_place(targetX,targetY+2,obj_collision)
{offsetTargetY = 2;}

for (var i = 0; i < room_height; ++i) {
	ground_y = round((bbox_bottom+i)/20)*20
	if (collision_line(bbox_left,ground_y,bbox_right,ground_y,obj_collision,0,0))
	{
		break;
	}
}

for (var j = 0; j < room_height; ++j) {
	var xx = xspd*20
	var xx2 = xspd*30
	
	ground_y1 = round((bbox_bottom+j)/20)*20
	
	var detect_coll = collision_line(x+(xspd*20),ground_y1-10,x+(xspd*30),ground_y1-10,obj_collision,0,0)
	if (detect_coll != noone) && (detect_coll.bbox_top < bbox_bottom+2)
	{
		xx = 0
		xx2 = 0
	}
	
	if (collision_line(x+xx,ground_y1,x+xx2,ground_y1,obj_collision,0,0))
	|| (collision_line(x+xx,ground_y1,x+xx2,ground_y1,obj_void,0,0))
	{
		break;
	}
}

for (var k = 0; k <= jump_rangeY; ++k) {
	jump_range_limitY = k
	if (collision_rectangle(bbox_left,ground_y-jump_range_limitY,bbox_right,ground_y-1,obj_collision,true,0))
	{
		break;
	}
}

for (var l = 0; l <= jump_rangeY; ++l) {
	jump_range_detectY = l
	if (collision_rectangle(0,ground_y-jump_range_detectY,room_width,ground_y-1,obj_collision,true,0))
	{
		break;
	}
}

var list2 = ds_list_create()
var colly = noone
var disting = 999999

var coll2 = collision_rectangle_list(0,ground_y-(jump_range_detectY+1),room_width,ground_y-1,obj_collision,true,0,list2,false)
if (coll2 > 0)
{
	for (var i = 0; i < coll2; ++i)
	{
		var inst2 = list2[| i];
		
		var _dist = point_distance(x, ground_y, clamp(x,inst2.bbox_left,inst2.bbox_right), inst2.y);
		
		if (_dist < disting) {
			disting = _dist;
			colly = inst2
		}
	}
}

if (ground_y-jump_rangeY > obj_flower.bbox_bottom)
{
	if (colly)
	{
		if x < colly.bbox_left+((colly.image_xscale*20)/2)
		{
		targetX = colly.bbox_left+10
		}
		else
		{
		targetX = colly.bbox_right-10
		}
		targetY = colly.bbox_top-10
	}
	else if collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_collision,false,true)
	{
		targetX = obj_flower.x
		targetY = obj_flower.y
	}
}
else //if (x == targetX && y == targetY)
{
	targetX = obj_flower.x
	targetY = obj_flower.y
}

ds_list_destroy(list2)

if mp_grid_path(obj_grid.grid,path,x,y-offsetY,targetX,targetY-offsetTargetY,true)
{
	var crl_length = 1;
	path_start(path,10,path_action_stop,true)
	path_end()
	
	var xx = path_get_point_x(path,crl_length)
	var yy = path_get_point_y(path,crl_length)
	
	if (x > xx)
	{xspd = -1}
	else if (x < xx)
	{xspd = 1}
	else
	{xspd = 0;}
	
	if instance_place(x,y+1+yspd,obj_collision)
	{
		var crlY = 9
		if (ground_y > obj_flower.bbox_bottom-2)
		{
			crlY = 0;
		}
		
		if (y-10 > yy+crlY)
		{
			text = 1
			if (collision_rectangle(bbox_left-(3-(abs(xspd)*3))+(xspd*jump_rangeX),ground_y-jump_range_limitY+1,bbox_right+(3-(abs(xspd)*3))+(xspd*jump_rangeX),ground_y-1,obj_collision,false,true)
			&& !collision_rectangle(bbox_left,ground_y-jump_rangeY,bbox_right,ground_y-1,obj_collision,false,true))
			|| (!collision_rectangle(bbox_left+(xspd*pit_rangeX),ground_y1,bbox_right+(xspd*pit_rangeX),ground_y1+1,obj_collision,false,true) && (ground_y1 >= obj_flower.bbox_bottom-1))
			{yspd = -jspd;}
		}
		else
		{
			text = 2
			var list = ds_list_create()
			var inst = noone
			var coll = collision_line_list(x,ground_y1,x+(xspd*3000),ground_y1,obj_void,false,true,list,true)
			if (coll > 0)
			{
				for (var i = 0; i < coll; ++i)
				{
					var inst2 = list[| i];
					if (jump_rangeX2 <= inst2.image_xscale*20 && ((jump_range_limitY)/7.5) < inst2.image_xscale*jump_rangeX2)
					{inst = inst2}
				}
			}
			
			if (!collision_rectangle(bbox_left+(xspd*pit_rangeX),ground_y1-1,bbox_right+(xspd*pit_rangeX),ground_y1+1,obj_collision,false,true) && (ground_y1 >= obj_flower.bbox_bottom-1))
			|| (collision_rectangle(bbox_left-1+(xspd*jump_rangeX),ground_y-jump_range_limitY,bbox_right+1+(xspd*jump_rangeX),ground_y-1,obj_collision,false,true)
			&& (inst != noone) && (ground_y >= obj_flower.bbox_bottom))
			//
			
			{yspd = -jspd;}
		}
	}
	//text = yy
	/*if (y > yy)
	{yspd = -1}
	else if (y < yy)
	{yspd = 1}
	else
	{yspd = 0;}*/
}

if instance_place(x+(xspd*spd),y-(1-should_jump),obj_collision)
{
	xspd = 0;
	x = round(x/2)*2;
}

if instance_place(x,y+yspd,obj_collision)
{
	yspd = 0;
	if collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+21+yspd,obj_collision,false,true)
	{should_jump = 1}
	else
	{
		if collision_rectangle(bbox_left,bbox_top-1+yspd,bbox_right,bbox_top,obj_collision,false,true)
		{y = ceil(y/4)*4}
		else{y = round(y/2)*2}
	}
}
else
{
	if !instance_place(x,y+1+(yspd/2),obj_collision)
	{
	if (yspd < term_vel)
	{yspd += grav}else
	{yspd = term_vel}
	}
	
	if !collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+2+yspd,obj_collision,false,true)
	{should_jump = 0}
}


if (point_distance(x,y,targetX,targetY) < spd)
{
	max_spd = abs(x-targetX)
}
else
{
	max_spd = spd
}

x += (xspd*max_spd)
y += yspd

#endregion

if (xspd != 0)
{
	image_xscale = sign(xspd)
	if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+2+yspd,obj_collision,false,true))
	{
		if sprite_index != spr_nako_jump
		{image_index = 0}
		sprite_index = spr_nako_jump
		if (image_index > image_number - 1)
		{image_index = image_number - 1;}
	}
	else
	{
		if sprite_index != spr_nako_walk
		{image_index = 0}
		sprite_index = spr_nako_walk
	}
}
else
{
	if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+2+yspd,obj_collision,false,true))
	{
		if sprite_index != spr_nako_jump
		{image_index = 0}
		sprite_index = spr_nako_jump
		if (image_index > image_number - 1)
		{image_index = image_number - 1;}
	}
	else
	{
		if sprite_index != spr_nako
		{image_index = 0}
		sprite_index = spr_nako
	}
}
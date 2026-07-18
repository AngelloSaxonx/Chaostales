//Destination
#region
//State
switch (state)
{
case "Wandering":
if (timer_rescout > 0) 
{
	timer_rescout--;
	if (check_my_self = 1)
	{
		destinationX = x
		destinationY = y
	}
}
else
{
	sub_state = "Scouting"//choose("Scouting","Scouting","Gathering")
	
	switch (sub_state)
	{
		case "Scouting":
			check_my_self = 0;
			randomise()
			var roll = irandom(instance_number(obj_collision)-1)
			var random_coll = instance_find(obj_collision,roll)
			if (random_coll != noone){
			destinationX = random_range(random_coll.LPoint,random_coll.RPoint)
			destinationY = random_coll.YPoint
			}
			if mp_grid_path(Obj_grid.cell,path,x,y,TargetX,TargetY-1,true)
			{
				timer_rescout = 300;
			}
		break;
		case "Gathering":
			check_my_self = 0;
			randomise()
			var roll1 = irandom(instance_number(obj_crimson_bush)-1)
			checker = roll1;
			var random_coll1 = instance_find(obj_crimson_bush,roll1)
			if (random_coll1 != noone){
			destinationX = random_coll1.x
			destinationY = random_coll1.bbox_bottom-1
			}
			if mp_grid_path(Obj_grid.cell,path,x,y,TargetX,TargetY-1,true)
			{
				timer_rescout = 300;
			}
		break;
	}
}
break;




case "Chasing":
destinationX = Target.x
destinationY = Target.y
break;

}

// Decetion
var coll_see = collision_line(x,y-1,Target.x,Target.y-1,obj_collision,true,true)
if collision_circle(x,y,detect_range,Target,false,true) && (!coll_see)
{
	state = "Chasing";
}
else
{
	state = "Wandering";
}

#endregion





// Checking Y Ground
#region
var list = ds_list_create()
var nearesty = noone
var dist = 9999999;
var coll = collision_rectangle_list(bbox_left,y,bbox_right,room_height,obj_collision,true,true,list,true)
if (coll > 0)
{
	for (var d = 0; d < coll; d++) {
		var inst = list[| d];
		var dist2 = point_distance(x, y, inst.x, inst.y);

		if (dist2 < dist)
		{
			dist = dist2;
			nearesty = inst;
		}
	}
	ds_list_destroy(list);
}

if (nearesty != noone)
{
	y_ground = nearesty.YPoint-10
}
else
{
	y_ground = room_height
}
#endregion
//Pathing
#region
if (mp_grid_path(Obj_grid.cell,path,x,y,TargetX,TargetY-1,true))
{
	path_start(path,3,path_action_stop,true)
	path_end()
	var fall_down_value = 1;
	
	if (TargetY-1 > y_ground) && 
	(!collision_rectangle(x+xspd,
	bbox_bottom,x+(xspd*pit_check_range),
	bbox_bottom+pit_check_depth,
	obj_collision,true,true))
	{fall_down_value = 2}
	
	var _xx = path_get_point_x(path,fall_down_value)
	var _yy = path_get_point_y(path,fall_down_value)
	
	if (point_distance(x,y,destinationX,destinationY) > 15)
	{
		if (x < _xx-spd)
		{xspd = 1}
		else if (x > _xx+spd)
		{xspd = -1}
		else
		{xspd = 0}
		if (y < _yy-10)    // fall
		{
			var coll2 = collision_rectangle(x,bbox_bottom,x+min((xspd*fall_range)*spd,TargetX-x),bbox_bottom+min(fall_range*spd,(TargetY-1+pit_check_depth)-y),obj_collision,true,true)
			var coll3 = instance_place(x,y+5,obj_collision)
			if (coll2 != noone && coll3 != noone && coll2.id != coll3.id) 
			//&& (!collision_rectangle(x+xspd,bbox_bottom,x+(xspd*pit_check_range),bbox_bottom+pit_check_depth,obj_collision,false,true))
			{should_jump = 1;} else {should_jump = 0}
		}
		else if (y > _yy+10)  // jump
		{
			var in_swim = instance_place( x, y, obj_swim)
			var coll_see1 = collision_rectangle(x,bbox_top,x+(xspd*jump_range),bbox_bottom,obj_collision,true,true)
			//check ground
			if (((coll_see1 && coll_see1.mask_index == sprite_index) ||
			(!collision_rectangle(x+xspd,bbox_bottom,x+(xspd*pit_check_range),bbox_bottom+pit_check_depth,obj_collision,true,true) )) 
			
			//check water
			&& !in_swim) || (in_swim && TargetY < y)
			//Deciding to jump
			{should_jump = 1;} else {should_jump = 0;}


		}
		else
		{
			//check ground
			var check_water = collision_rectangle(bbox_left,y,bbox_right,y_ground,obj_swim,false,true)
			if ((xspd == 1 && (!collision_rectangle(x,bbox_bottom,x+pit_check_range,bbox_bottom+pit_check_depth,obj_collision,true,true) ))
			|| (xspd == -1 && (!collision_rectangle(x-pit_check_range,bbox_bottom,x,bbox_bottom+pit_check_depth,obj_collision,true,true) )))
			
			//check water
			&& ((!check_water && TargetY-1 <= y_ground)
			|| (check_water && TargetY < y))
			
			//Deciding to jump
			{should_jump = 1;} else { should_jump = 0;}
		}
	}
	else
	{
		if (x < destinationX-spd)
		{xspd = 1}
		else if (x > destinationX+spd)
		{xspd = -1}
		else
		{xspd = 0}
		should_jump = 0;
	}
}
#endregion
//Finding
#region

if (((point_in_rectangle(destinationX,destinationY,x-room_width,y_ground-detect_range,x+room_width,y_ground)
&& (place_meeting(x,y+5,obj_collision) || place_meeting(x,y,obj_swim)))
|| (destinationY-1 >= y_ground-1)) || timer_rescout <= 0)
{
	TargetX = destinationX
	TargetY = destinationY
}
else
{
	var inst = instance_place(x,y+5,obj_collision)
	if (inst)
	{
		//if destination isn't near, continue as usual
		if (point_distance(x,y,destinationX,destinationY) > 15)
		{
		//Checking Left
		if (xspd == 1) //&& ((inst.nearest != noone) && (inst.nearest.YPoint-jump_range < destinationY))
		{
			if (inst.nearest != noone) && (inst.RPoint - inst.nearest.LPoint < jump_range)
			{
				TargetX = inst.nearest.LPoint
				TargetY = inst.nearest.YPoint
			}
			else
			{
				TargetX = inst.x//LPoint
				TargetY = inst.bbox_top//YPoint
			}
		}
		else
		{xspd = -1}
		
		//Checking Right
		if (xspd == -1) //&& ((inst.nearest2 != noone) && (inst.nearest2.YPoint-jump_range < destinationY))
		{
			if (inst.nearest2 != noone) && (inst.LPoint - inst.nearest2.RPoint < jump_range) 
			{
				TargetX = inst.nearest2.RPoint
				TargetY = inst.nearest2.YPoint
			}
			else
			{
				TargetX = inst.x//RPoint
				TargetY = inst.bbox_top//YPoint
			}
		}
		else
		{xspd = 1}
		
		}
		//otherwise stop
		else
		{xspd = 0;}
	}
}

#endregion
//Water Grav
#region
var _ins = instance_place( x, y, obj_swim)
var _at_surface = false;
//If there's water nearby
if instance_exists(_ins)
{
	can_jump = 1
    var _yy = _ins.bbox_top+12 //_ins.y+sprite_height/2
    if (y > _yy){y = _yy};

    //If you go to water
    if y+yspd <= _ins.y
    {
        yspd -= grav*2;
        //If you jump out the water
        if y+yspd <= _ins.y
        {
            y = _ins.y;
            if yspd >= 0
			{
				_at_surface = true;
			}
        }
    }
}
#endregion
//Movement
#region
//Grav
//Coll_rectangle for checking feet, while ins_place check whole body
if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+2,obj_collision,true,true)) 
&& (_at_surface == false)
{if (yspd < max_grav) {yspd += grav} else {yspd = max_grav} }

//Ycoll
if (instance_place(x,y+1+yspd,obj_collision))
{
	//Coll_rectangle for checking feet, while ins_place check whole body
	var coll5 = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+2,obj_collision,true,true)
	if (coll5)
	{yspd = 0;} 
	//if stuck while jumping, stop yspd once for Grav to work
	else {if (make_unstuck == 0){yspd = 0; make_unstuck = 1;}}
	
	if (can_jump == 0) && (coll5)
	{
	can_jump = 1;
	}
}
else
{
	make_unstuck = 0;
}

//jumping
if (should_jump == 1) && (can_jump == 1) && (place_meeting(x,y+2,obj_collision) || place_meeting(x,y,obj_swim))
{
	yspd = -jspd
	can_jump = 0;
}

//Xcoll
if place_meeting(x+(xspd*spd),y,obj_collision)
{
	xspd = 0;
}
//Movement
x += xspd*spd
y += yspd
#endregion

depth = -300;

if (bbox_top > room_height)
{
	instance_destroy()
}
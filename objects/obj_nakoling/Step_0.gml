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
	sub_state = choose("Scouting","Scouting","Scouting","Resting","Gathering")
	
	switch (sub_state)
	{
		case "Scouting":
			check_my_self = 0;
			randomise()
			var roll = irandom(instance_number(obj_pathfindable)-1)
			var random_coll = instance_find(obj_pathfindable,roll)
			if (random_coll != noone){
			destinationX = random_range(random_coll.LPoint,random_coll.RPoint)
			destinationY = random_coll.YPoint+1
			}
			if mp_grid_path(obj_grid.cell,path,x,y,TargetX,TargetY-1,true)
			{timer_rescout = 300;}
		break;
	}
}
break;




case "Chasing":
if instance_exists(Target)
{
destinationX = Target.x
destinationY = Target.y
}
else
{
destinationX = x
destinationY = y
}
sub_state = "Scouting";
break;

}

// Decetion
var coll_see = noone
if instance_exists(Target)
{coll_see = collision_line(x,y-1,Target.x,Target.y-1,obj_collision,true,true)}
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
if (hurted == 0){
#region
if (mp_grid_path(obj_grid.cell,path,x,y,TargetX,TargetY-1,true))
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
			var coll_see1 = collision_rectangle(x,bbox_top-jump_range,x+(xspd*jump_range),bbox_bottom,obj_collision,true,true)
			//check ground
			if (((coll_see1 && coll_see1.mask_index == sprite_index) ||
			(!collision_rectangle(x+(xspd*20),bbox_bottom,x+(xspd*pit_check_range),bbox_bottom+pit_check_depth,obj_collision,true,true) )) 
			
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
var coll_land = destinationY;
var inst2 = instance_place(x,y+max(2,yspd),obj_pathfindable)
if (inst2)
{
	if (inst2.nearest != noone) && (xspd = -1)
	{
		coll_land = inst2.nearest.YPoint
	}
	else if (inst2.nearest2 != noone) && (xspd = 1)
	{
		coll_land = inst2.nearest2.YPoint
	}
}
var coll_jump_limit = collision_rectangle(x,bbox_bottom-(jump_range),x+(xspd*jump_range),bbox_bottom-1,obj_collision,true,true) 

if (mp_grid_path(obj_grid.cell,path,x,y,destinationX,destinationY-1,true) && 
(destinationY > y || (destinationY <= y && coll_land < y-(jump_range/3)))) ||
((((point_in_rectangle(destinationX,destinationY,x-room_width,y_ground-detect_range,x+room_width,y_ground)
&& (place_meeting(x,y+5,obj_collision) || place_meeting(x,y,obj_swim)))
|| (destinationY-1 >= y_ground-1)) || timer_rescout <= 0) && (!coll_jump_limit))
{
	TargetX = destinationX
	TargetY = destinationY
}
else
{
	var inst = instance_place(x,y+max(2,yspd),obj_pathfindable)
	if (inst)
	{
		//if destination isn't near, continue as usual
		if (point_distance(x,y,destinationX,destinationY) > 15)
		{
		//Checking Left
		if (xspd == 1) //&& ((inst.nearest != noone) && (inst.nearest.YPoint-jump_range < destinationY))
		{
			if (inst.nearest2 != noone) && (abs(inst.RPoint - inst.nearest2.LPoint) < jump_range)
			{
				TargetX = inst.nearest2.LPoint
				TargetY = inst.nearest2.YPoint
			}
			else
			{
				TargetX = inst.RPoint
				TargetY = inst.YPoint
			}
		}
		else
		{xspd = -1}
		
		//Checking Right
		if (xspd == -1) //&& ((inst.nearest2 != noone) && (inst.nearest2.YPoint-jump_range < destinationY))
		{
			if (inst.nearest != noone) && (abs(inst.LPoint - inst.nearest.RPoint) < jump_range) 
			{
				TargetX = inst.nearest.RPoint
				TargetY = inst.nearest.YPoint
			}
			else
			{
				TargetX = inst.LPoint
				TargetY = inst.YPoint
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
}
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
	
	if (can_jump == 0) && (coll5) && (LeapX == 0)
	{
	can_jump = 1;
	}
}
else
{
	make_unstuck = 0;
}

//jumping
if (place_meeting(x,y+2,obj_collision) || place_meeting(x,y,obj_swim))
{
	if (should_jump == 1) && (can_jump == 1)
	{
		yspd = -jspd
		can_jump = 0;
	}
	else if (LeapX != 0) && (can_jump == 1) && (sign(LeapX) == sign(Target.x - x))
	{
		yspd = -(jspd/2);
		can_jump = 0;
	}
}
//Xcoll
if place_meeting(x+(xspd*spd),y,obj_collision)
{
	xspd = 0;
}
//Movement

//Hurted
if (sprite_index == spr_nakoling_hurt) && (hurted == 0)
{
	hurted = 1
	alarm[1] = 40;
	xspd = knockX;
	yspd = knockY;
}
	
if (hurted == 1) && (place_meeting(x,y+yspd+2,obj_collision))
{sprite_index = idle_spr;knockX = 0;knockY = 0;hurted = 0;}

//Knockback because hurted
if (hurted == 1)
{
	LeapX = 0
	x += xspd
	y += yspd
}
//Otherwise Move Normally
else
{
	if (LeapX == 0)
	{x += xspd*spd}
	else
	{
		xspd = 0;
		x += LeapX
	}

	y += yspd
}
#endregion

//Attack
#region
if (hurted == 0){
if collision_circle(x,y,detect_range/2.5,Target,false,true) && (!coll_see)
{
	if instance_place(x+LeapX,y,obj_collision) || 
	(!collision_rectangle(bbox_left+(20*image_xscale),y,bbox_right+(20*image_xscale),y+10,
	obj_collision,false,true) && instance_place(x,y+2,obj_collision))
	{image_xscale = -image_xscale}
	LeapX = (image_xscale*spd);
}
else
{
	if instance_exists(Target) || 
	(!instance_exists(Target) && place_meeting(x,y+2,obj_collision))
	{LeapX = 0;can_jump = 1;}
}
}

var AtkX = x+(image_xscale*10)
var AtkY = bbox_bottom-10
if (LeapX != 0 && image_index > 2 && image_index < 2.2 && !place_meeting(x,y+2,obj_collision))
{
	if (from == noone)
	{
		var atk = instance_create_depth(AtkX,AtkY,depth,Obj_hitbox_nakoling_slash)
		atk.image_xscale = image_xscale
		from = atk.id
	}
}
if (from != noone) {
	if instance_exists(from) {from.x = AtkX+LeapX; from.y = AtkY+yspd; from.image_xscale = image_xscale}
	else {from = noone}
};
#endregion
//Animation
#region
if (xspd != 0) && (hurted = 0) && (abs(xspd) <= 1)
{
	image_xscale = sign(xspd)
}
if (yspd != 0) && (!instance_place(x,y+2+yspd,obj_collision))
{
	if (hurted = 0)
	{
	if (LeapX == 0)
	{
		if (sprite_index != jump_spr)
		{
			image_index = 0
		}
	
		if (yspd < 0)
		{
			image_index = 0;
		}
		else
		{
			if (image_index >= image_number - 1)
			{
				image_speed = 0;
			}
		}
		sprite_index = jump_spr
	}
	else
	{
		if (sprite_index != attack_spr)
		{
			image_index = 0
		}
		if (image_index >= image_number - 1)
		{
			image_speed = 0;
		}
		sprite_index = attack_spr
	}
	}
}
else
{
	image_speed = 1;
	if (xspd != 0) || (LeapX != 0)
	{
		if (sprite_index != walk_spr)
		{
			image_index = 0
		}
		sprite_index = walk_spr
	}

}
#endregion

depth = 300;

if (bbox_top > room_height)
{
	instance_destroy()
}

if (Health_bar <= 0)
{
	instance_destroy()
}
//Syncing
if (mergable == 1)
{
	var merging = collision_rectangle(bbox_right+1,bbox_top,bbox_right+20,bbox_bottom,obj_collision,true,true)
	if (merging != noone) && (merging.mergable == 1)
	{
		decor_xscale += merging.decor_xscale;
		instance_destroy(merging)
	}
	image_xscale = decor_xscale
	LPoint = bbox_left+10
	RPoint = bbox_right-10

	YPoint = bbox_top-10
	with (obj_grid){mp_grid_add_instances(cell,obj_collision,true)}
}

with (obj_collision)
{
    // ignore itself
    
    if (id != other.id)
    {
	    var dis = point_distance(other.RPoint, other.YPoint, LPoint, YPoint);

	    // must be close enough
	    if (dis <= other.max_dist) && (other.YPoint >= YPoint && other.YPoint-YPoint > 20)
	    {
	        // nearest valid wall
	        if (dis < other.dist)
	        {
	            other.dist = dis;
	            other.nearest = id;
	        }
	    }
		
		var dis2 = point_distance(other.LPoint, other.YPoint, RPoint, YPoint);

	    // must be close enough
	    if (dis2 <= other.max_dist) && (other.YPoint >= YPoint && other.YPoint-YPoint > 20)
	    {
	        // nearest valid wall
	        if (dis2 < other.dist2)
	        {
	            other.dist2 = dis2;
	            other.nearest2 = id;
	        }
	    }
		
	}
}


if (put_pathing == 0) && (instance_exists(obj_nakoling))
{
var inst = instance_create_depth(x,y,depth,obj_pathfindable)
if (inst)
{
	inst.x = x
	inst.y = y
	inst.sprite_index = sprite_index
	inst.mask_index = mask_index
	
	inst.image_xscale = image_xscale
	inst.image_yscale = 1//image_yscale
	
	inst.LPoint = LPoint
	inst.RPoint = RPoint
	inst.YPoint = YPoint
	
	if instance_place(inst.x,inst.YPoint,obj_collision)
	|| (!collision_rectangle(bbox_left,bbox_top-room_height,bbox_right,bbox_top,obj_collision,true,true))
	{
		instance_destroy(inst)
	}
}
put_pathing = 1
}
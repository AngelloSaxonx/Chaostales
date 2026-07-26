with (obj_pathfindable)
{
    // ignore itself
    
    if (id != other.id)
    {
	    var dis = point_distance(other.LPoint, other.YPoint, RPoint, YPoint);
		var dir = point_direction(other.LPoint, other.YPoint, RPoint, YPoint)
	    // must be close enough
	    if (dis <= other.max_dist) /*&& (other.YPoint >= YPoint && other.YPoint-YPoint > 20)*/ && (dir > 90 && dir < 270)
	    {
	        // nearest valid wall
	        if (dis < other.dist)
	        {
	            other.dist = dis;
	            other.nearest = id;
	        }
	    }
		
		var dis2 = point_distance(other.RPoint, other.YPoint, LPoint, YPoint);
		var dir2 = point_direction(other.RPoint, other.YPoint, LPoint, YPoint)
	    // must be close enough
	    if (dis2 <= other.max_dist) /*&& (other.YPoint >= YPoint && other.YPoint-YPoint > 20)*/ && (dir2 < 90 || dir2 > 270)
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
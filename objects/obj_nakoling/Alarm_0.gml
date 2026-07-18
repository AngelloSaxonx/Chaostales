randomise()
var roll = irandom(instance_number(obj_collision)-1)
var random_coll = instance_find(obj_collision,roll) 

destinationX = random_range(random_coll.bbox_left,random_coll.bbox_right)
destinationY = random_coll.bbox_top

time_rerun = 1;
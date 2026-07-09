if place_meeting(x,y,obj_azure) and !instance_exists(obj_transition){

var _instantiated = instance_create_depth(0,0,-9999,obj_transition)
_instantiated.target_rm = target_rm;
_instantiated.target_x = target_x;
_instantiated.target_y = target_y;



}
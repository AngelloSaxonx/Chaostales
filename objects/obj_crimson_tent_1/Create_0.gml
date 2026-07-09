var _layer = layer_get_id_at_depth(-999)[0];
if(_layer == -1) _layer[0] = layer_create(-900);
if(_layer != -1) _layer[1] = layer_create(300);

layer_sprite_create(_layer[0], x, y, spr_crimson_tent_1);

// if noone, then make new, else just overwrite the array with the top layer
if(layer[0] == -1) layer = layer_create(-9999) else layer = layer[0];

var coll = instance_create_depth(x,y,depth-1,obj_collision)
with (coll)
{
sprite_index = spr_crimson_tent_1_collision
unique_mask = sprite_duplicate(sprite_index);

var _left = 0;
var _top = 0;
var _right = 159;
var _bottom = 59;

sprite_collision_mask(unique_mask, false, bboxmode_manual, _left, _top, _right, _bottom, bboxkind_precise, 0);

mask_index = unique_mask;
LPoint = bbox_left+10
RPoint = bbox_right-10
YPoint = (bbox_top+40)-10
grabableTop = YPoint+10
}

var coll2 = instance_create_depth(x,y,depth-1,obj_collision)
with (coll2)
{
sprite_index = spr_crimson_tent_1_collision
unique_mask = sprite_duplicate(sprite_index);

var _left = 0;
var _top = 120;
var _right = 159;
var _bottom = 159;

sprite_collision_mask(unique_mask, false, bboxmode_manual, _left, _top, _right, _bottom, bboxkind_precise, 0);


mask_index = unique_mask;
LPoint = bbox_left+10
RPoint = bbox_right-10
YPoint = bbox_top-10
grabableTop = YPoint+10
}

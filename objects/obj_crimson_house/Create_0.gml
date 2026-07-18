var _layer = layer_get_id_at_depth(-999)[0];
if(_layer == -1) _layer[0] = layer_create(-900);
if(_layer != -1) _layer[1] = layer_create(360);

layer_sprite_create(_layer[0], x, y, spr_crimson_house_front);
layer_sprite_create(_layer[1], x, y, spr_crimson_house_back);


if(layer[0] == -1) layer = layer_create(-9999) else layer = layer[0];
mask_index = spr_crimson_house_collision

for (var i = 0; i < sprite_width/20; ++i) {
	for (var j = 0; j < sprite_height/20; ++j) {
		var coll = instance_create_depth(bbox_left+(i*20),bbox_top+(j*20),depth-1,obj_collision)
		coll.mergable = 1;
		if !instance_place(x,y,coll)
		{
			instance_destroy(coll)
		}
	}
}
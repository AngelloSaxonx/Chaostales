var list = ds_list_create();
var inst = noone
var player_inst = noone
var _num = instance_place_list(x, y, obj_hurtbox, list, false);

if (_num > 0)
{
    for (var i = 0; i < _num; ++i)
    {
		var check_inst = list[| i]
        if (check_inst.from != id)
		{
		inst = check_inst
		}
		else
		{
		player_inst = check_inst
		}
    }
}
else
{
	instance_destroy()
}

ds_list_clear(list)

if (inst != noone) && (inst.hittable == true)  && (hitted == 0)
{
	var _face = image_xscale
	var _power = knock_Dis
	with(inst)
	{
		if (object_index == obj_flower)
		{
			obj_stats.hp--;
			sprite_index = spr_flower_hurt;
			face = -_face;
			knockY = -_power
			knockX = (_power/2)*_face
		}
		else{instance_destroy()}
	}
	
	hitted = 1;
	alarm[1] = 60
}
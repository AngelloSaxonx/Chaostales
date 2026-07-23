var inst = instance_place(x, y, Obj_hurtbox);

if (inst != noone) && (inst.hittable == true) && (inst.from != id)
{
	with(inst)
	{
		instance_destroy()
	}
}

var player_inst = instance_place(x, y, obj_floriel);
if (player_inst != noone) && (player_inst.from == id) 
&& (player_inst.sprite_index == spr_floriel_ledge || player_inst.sprite_index == spr_floriel_round)
{
	instance_destroy()
}
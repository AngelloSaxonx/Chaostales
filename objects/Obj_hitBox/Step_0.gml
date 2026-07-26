var inst = instance_place(x, y, Obj_hurtbox);

if (inst != noone) && (inst.hittable == true) && (inst.from != id) && (hitted == 0)
{
	hitted = 1;
	alarm[1] = 60
	with(inst)
	{
		if (object_index == obj_nakoling)
		{Health_bar--;}
		else{instance_destroy()}
	}
}

var player_inst = instance_place(x, y, obj_floriel);
if (player_inst != noone) && (player_inst.from == id) 
&& (player_inst.sprite_index == spr_floriel_ledge || player_inst.sprite_index == spr_floriel_round)
{
	instance_destroy()
}
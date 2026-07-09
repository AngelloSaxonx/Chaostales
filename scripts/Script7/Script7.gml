function Attack_stage_for_player(){
	if (state != scr_state_dash) && (state != scr_wall_recovery)
	{
		var AtkX = x+(image_xscale*face)
		var AtkY = bbox_bottom-10
	
	
		if (attack_key) && (from == noone)
		{
			var atk = instance_create_depth(AtkX,AtkY,depth,Obj_hitBox)
			atk.image_xscale = face
			from = atk.id
		}
	
		if (from != noone) {
			if instance_exists(from) {from.x = AtkX+xspd; from.y = AtkY+yspd; from.image_xscale = face}
			else {from = noone}
		};
	}
}
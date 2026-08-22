event_inherited()
Health_bar = 10//obj_stats.hp
test_text = 0;
scr_contol_setup()

mask_spr = spr_flower;
idle_spr = spr_flower;
walk_spr = spr_flower_walk;
run_spr = spr_flower_run;
ledge_spr = spr_flower_ledge
jump_spr = spr_flower_jump;
dash_air_spr = spr_flower_round;

attack_spr[0] = spr_flower_stab_final
attack_spr[1] = spr_flower_stab_body
attack_spr[2] = spr_flower_stab_dagger
attack_spr[3] = spr_flower_stab_left_arm
image_moving = 0;
hurted = 0;
knockX = 0;
knockY = 0;
face = 1;

run_type = 0;
move_dir = 0;
move_spd[0] = 2
move_spd[1] = 3;
xspd = 0;
yspd = 0;

grav = .275;
term_vel = 4;
on_ground = true;
on_water = false
in_transition = false
ledge_in = false

can_jump = true // in case
jump_max = 2;
jump_count = 0;
jump_hold_timer = 0;
jump_hold_frames[0] = 16;

jspd[0] = -3*2; //Double the jump
jump_hold_frames[1] = 12;
jspd[1] = -5*2; //This too
ledge_jspd = 6

can_dash = true;
dash_distance = 40;
dash_time = 10;
ledge_fall_time = 20

can_run = true;
double_jump = true;

scr_state_idle = function()
{
	if (sprite_index == spr_flower_hurt) && (hurted == 0)
	{
		hurted = 1
		alarm[0] = 40;
		xspd = knockX;
		yspd = knockY;
	}
	
	if (hurted == 1) && (place_meeting(x,y+yspd,obj_collision))
	{sprite_index = idle_spr;hurted = 0;knockX = 0;knockY = 0;}
	
	
	if (hurted == 0) && (!instance_exists(obj_textbox))
	{
    move_dir = right_key - left_key;

    if move_dir != 0 {face = move_dir};

    run_type = run_key;
    
	if (move_dir != 0){
        xspd = move_dir * move_spd[run_type];
    } else /* if (on_ground == true)*/{
        xspd *= .98;
       if (xspd < 0.05) or (xspd > 0.05) xspd = 0;
    }
	}

    //Attack
	#region
	if (!instance_exists(obj_textbox))
	{
	Attack_stage_for_player()
	}
	#endregion
	
    if yspd >= 0 && !place_meeting(x + xspd, y + 1, obj_collision)
    {
    
    }
	
	if on_water = true
	{
		state = scr_state_swim;
	}
	
	if !place_meeting(x,y,obj_interact)
	{
		if (hurted == 0) && (!instance_exists(obj_textbox))
		{
	    scr_state_jump()
		}
	}
    scr_movement();
	
	var coll = instance_place(x+(move_dir*move_spd[0]),y,obj_collision)
	if ( (coll && (coll.bbox_top > bbox_top+1)))
	&& !(instance_place(x,y+20,obj_collision))
	{
		var stop_if_up = collision_rectangle(coll.bbox_left,coll.bbox_top-1,coll.bbox_left+10,coll.bbox_top,obj_collision,false,true)
		if (stop_if_up == noone) || (stop_if_up != noone && stop_if_up == id)
		{
			state = scr_wall_recovery
			xspd = 0;
			yspd = 0;
		}
	}

	if (hurted == 0)
	{
	if on_ground
	//Idle
	{
		image_speed = 1
		if abs(xspd) == 0 
	    {
			if (from != noone)
			{
				if sprite_index != attack_spr[0]
		        {image_index = 0}
				sprite_index = attack_spr[0]
			}
			else
			{
				if sprite_index != idle_spr
		        {image_index = 0}
				sprite_index = idle_spr
			}
		}
		//Run & Dash
		else if abs(xspd) >= move_spd[1] 
		{
			if sprite_index != run_spr{
			//Dash
			if !on_ground
			{
			if sprite_index != dash_air_spr
		    {image_index = 0}
			sprite_index = dash_air_spr;
			}
			//Run
			else{
			if sprite_index != run_spr
		    {image_index = 0}
			sprite_index = run_spr;
			}
			}
		}
		//Walk
		else 
		{
			if sprite_index != walk_spr
		    {image_index = 0}
			sprite_index = walk_spr
		};
	}
	//Jump
	else
	{    
	//Airdash
		image_speed = 1
		if abs(xspd) >= move_spd[1] 
		    {if sprite_index != dash_air_spr 
		        {image_index = 0}
		    sprite_index = dash_air_spr;
			}
		//Jump
		else if sprite_index != dash_air_spr 
		    {
				if sprite_index != jump_spr
		        {
					if (jump_key) {image_index = 0} // if you press jump
					else {image_index = 2} // Otherwise act like falling
				}
				else
				{
					if (jump_key_pressed && can_jump) {image_index = 0} //Double jumping refresh animation
				}
				sprite_index = jump_spr
			}
	}
	}
};

scr_wall_recovery = function()
{
	//grabbed
	if sprite_index != ledge_spr
    {image_index = 0}
	sprite_index = ledge_spr
	
	if (image_index > 1)
	{
		//start rolling
		if (ledge_in == false)
		{yspd = -ledge_jspd; ledge_in = true}
		if (yspd < 0)
		{
			if (image_index >= 6)
			{
				image_index = 2
			}
			xspd = (face*move_spd[0])
		}
		//staring backward
		else if (!place_meeting(x,y+1,obj_collision)) && (yspd >= 0){
			//if doesn't land in time, switch to idle
			if (ledge_fall_time <= 0)
			{
				ledge_fall_time = 20;
				state = scr_state_idle;
				ledge_in = false;
				image_index = 2;
				xspd = 0;
			}
			// if have time, still rolling
			else
			{
				ledge_fall_time--;
				if (image_index >= 6)
				{
					image_index = 2
				}
				xspd = (face*move_spd[0])
			}
		}
		//if land in time, landing animation
		else if (place_meeting(x,y+1,obj_collision)) && (yspd >= 0)
		{
			if (ledge_fall_time > 0)
			{
			if (ledge_fall_time > 5) {ledge_fall_time = 5}
			image_index = 6
			ledge_fall_time--;
			}
			
			if (image_index >= image_number)
			{state = scr_state_idle; ledge_in = false;ledge_fall_time = 20;}
			xspd = 0
		}
		//Grav
		if !place_meeting(x,y+1,obj_collision)
		{
			if (yspd < term_vel)
			{yspd += grav}else
			{yspd = term_vel}
		}
	}
	//Coll
	if place_meeting(x,y+yspd,obj_collision)
	{
		yspd = 0
	}
	if place_meeting(x+xspd,y,obj_collision)
	{
		xspd = 0;
	}
	//Movement
	x += xspd
	y += yspd
}

state = scr_state_idle;
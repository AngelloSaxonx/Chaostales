scr_contol_setup()

mask_spr = spr_azure_idle;
idle_spr = spr_azure_idle;
walk_spr = spr_azure_walk;
run_spr = spr_azure_run;
dash_spr = spr_azure_dash;
jump_spr = spr_azure_jump;
dash_jump_spr = spr_azure_dash_air;

face = 1;

run_type = 0;
move_dir = 0;
move_spd[0] = 2;
move_spd[1] = 4;
xspd = 0;
yspd = 0;

grav = .275;
term_vel = 4;
on_ground = true;

jump_max = 2;
jump_count = 0;
jump_hold_timer = 0;
jump_hold_frames[0] = 16;

jspd[0] = -3.15;
jump_hold_frames[1] = 12;
jspd[1] = -4.85;

can_dash = true;
dash_distance = 40;
dash_time = 10;

fast_step = true;
double_jump = true;

scr_state_idle = function(){
    move_dir = right_key - left_key;

    if move_dir != 0 {face = move_dir};

    run_type = run_key;
    
 if (move_dir != 0){
        xspd = move_dir * move_spd[run_type];
    } else if (on_ground == true){
        xspd *= .98;
       if (xspd < 0.05) or (xspd > 0.05) xspd = 0;
    }

    if can_dash && dash_key
    {
        can_dash = false
		if on_ground
		{
        dash_spd = dash_distance/dash_time;
        dash_energy = dash_time;
        xspd = face * dash_spd;
		}
        if !on_ground
        {
		dash_spd = dash_distance/dash_time;
        dash_energy = dash_time;
        xspd = face * dash_spd;
			if down_key
			{
				yspd = dash_spd + 10;
				xspd = 0
				dash_energy = dash_time
			}
        }
        
    state = scr_state_dash;
    }
    
    if yspd >= 0 && !place_meeting(x + xspd, y + 1, obj_collision)
    {
    
    }

    scr_state_jump()
    scr_movement();

if on_ground
    //Idle
    {if abs(xspd) == 0 
        {if sprite_index != idle_spr
            {image_index = 0}
        sprite_index = idle_spr}
    //Dash
    else if abs(xspd) >= move_spd[1] 
        {if sprite_index != run_spr
            {image_index = 0}
        sprite_index = run_spr;}
    //Walk
    else 
        {if sprite_index != walk_spr
            {image_index = 0}
        sprite_index = walk_spr};
    }
//Jump
else
    {    
    //Run Jump
    if abs(xspd) >= move_spd[1] 
        {if sprite_index != dash_jump_spr 
            {image_index = 0}
        sprite_index = dash_jump_spr}
    else if sprite_index != dash_jump_spr
        {if sprite_index != jump_spr
            {image_index = 0}
        sprite_index = jump_spr};
}


	
};

scr_state_dash = function()
    {
    if (dash_energy-- <= 0 || xspd == 0)
    {
        state = scr_state_idle;
        can_dash = true;
    }
    else
    {
    scr_movement(false,false);
    }
}

state = scr_state_idle;
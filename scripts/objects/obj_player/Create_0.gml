xspd = 0;
yspd = 0;
move_spd = 2;

jump_strength = -6.15;
jspd = -3.15;
jump_hold_frames = 12;
jump_count = 0
term_vel = 4;
grav = .375;


scr_update_movement = function(_use_grav = true, _use_term_vel = true)
{
	
    // X move
    var _sub_pixel = .5;
    if place_meeting(x + xspd,y , obj_collision){
        if !place_meeting(x + xspd, y - abs(xspd)-1, obj_collision){
            while place_meeting(x + xspd, y, obj_collision) {y -= _sub_pixel;};
        }else{
            var _pixel_check = _sub_pixel * sign(xspd);
            while !place_meeting(x + _pixel_check , y, obj_collision){
                x += _pixel_check;
            }
            xspd = 0;
        }
    }

    x += xspd;

    // Y move

    // gravity and terminal speed
    if _use_grav yspd += grav;
    if _use_term_vel && yspd > term_vel {yspd = term_vel};

    if place_meeting( x, y + yspd, obj_collision)
    {

        var _pixel_check = _sub_pixel * sign(yspd);
        while !place_meeting( x, y + _pixel_check, obj_collision)
        {
            y += _pixel_check;
        }

        if yspd < 0
        {
            jump_hold_timer = 0;
        }

        yspd = 0;
    }

    y += yspd;
	

	
}
scr_on_ground = function()
{
	return place_meeting(x, y + yspd + 1, obj_collision)
}

//Finite State Machine
enum scr_state_azure
{
	idle,
	walk,
	jump,
	fall
}

state = scr_state_azure.idle;
inner_state = 0;//0-Begin, 1-Update, 2-Exit
next_state = state;

scr_change_state = function(_next_state)
{
	next_state = _next_state;
	inner_state = 2;
}
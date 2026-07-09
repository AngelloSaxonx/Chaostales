function scr_state_jump(){
    if double_jump = false{jump_max = 1;}
    else {jump_max = 2;}

    if on_ground
    {
        jump_count = 0;
        jump_hold_timer = 0;
    }
    else
    {
        if jump_count == 0{jump_count = 1;}
    }
    // Jump
    if jump_key_buffered && jump_count < jump_max
    {
        jump_key_buffered = false;
        jump_key_buffer_timer = 0;

        jump_count++;

        jump_hold_timer = jump_hold_frames[jump_count-1];
    }
    if !jump_key
    {
        jump_hold_timer = 0;
    }
    if jump_hold_timer > 0
    {
        yspd = jspd[jump_count-1];

        jump_hold_timer--;
    }
}

function scr_movement(_use_grav = true, _use_term_vel = true){
    // X move
    var _sub_pixel = .5;
    if place_meeting(x + xspd ,y , obj_collision){
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

    // gravity and terminal speed only in free state
    if _use_grav yspd += grav;
    if _use_term_vel && yspd > term_vel {yspd = term_vel};

    var _sub_pixel = .5
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

    on_ground = yspd >= 0 && place_meeting( x, y+1, obj_collision)

    y += yspd;

}

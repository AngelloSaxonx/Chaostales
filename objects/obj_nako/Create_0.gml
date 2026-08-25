path = path_add()
image_moving = 0;
attack_spr[0] = spr_nako_swing_final
attack_spr[1] = spr_nako_swing_body
attack_spr[2] = spr_nako_swing_left_arm
attack_spr[3] = spr_nako_swing_right_arm

xspd = 0;
yspd = 0;
jspd = 6
spd = 1
grav = .275
term_vel = 4;
max_spd = spd
should_jump = 0;
ground_y = bbox_bottom
ground_y1 = bbox_bottom
jump_rangeX = 32
jump_rangeX2 = 32
jump_rangeY = 63
jump_range_limitY = 0;
jump_range_detectY = 0;
pit_rangeX = 14+(spd*6)

know = 0;

target = obj_flower
targetX = target.x
targetY = target.y
target_offsetX = 0
target_offsetY = 0

attack = false
from = 0
cooldown = 0;

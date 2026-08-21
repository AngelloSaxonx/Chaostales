draw_self()

draw_path(path,x,y,true)

draw_text(x,bbox_top-40,string(ground_y) +" > " + string(obj_flowerl.bbox_bottom))
draw_text(x,bbox_top-60,text)

draw_rectangle(bbox_left+(xspd*pit_rangeX),ground_y1,bbox_right+(xspd*pit_rangeX),ground_y1+1,true)

draw_rectangle(bbox_left-xspd,ground_y-jump_range_limitY+1,bbox_right-xspd,ground_y-1,true)
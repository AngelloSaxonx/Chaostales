depth = 0

grid = mp_grid_create(0,0,room_width/20,room_height/20,20,20)

mp_grid_add_instances(grid,obj_collision,false)
mp_grid_add_instances(grid,obj_void,false)
mp_grid_add_instances(grid,Obj_path_blocker,false)
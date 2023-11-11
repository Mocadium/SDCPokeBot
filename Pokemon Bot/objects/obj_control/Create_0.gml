#region Application
	global.debug = false;
	global.fullscreen = false;
#endregion
#region Delta Time
	global.delta_time_scale = 1.0;
	global.delta_time_paused = false;
	global.delta_time_real = (60/1000000)*delta_time;
	global.delta_time_game = global.delta_time_real*global.delta_time_scale*!global.delta_time_paused;
#endregion
#region Camera
	global.camera_x = 0;
	global.camera_y = 0;
	global.camera_w = 320;
	global.camera_h = 180;
	
	camera_set_view_pos(view_camera[0], global.camera_x, global.camera_y);
	camera_set_view_size(view_camera[0], global.camera_w, global.camera_h);
#endregion
#region Network
	server = network_create_server_raw(network_socket_tcp, 55555, 32);
#endregion
dpad = undefined;
#region Application
	global.debug ^= keyboard_check_pressed(vk_f3);
	if (global.debug) {
		if (keyboard_check_pressed(ord("R")))
			game_restart();
	}
	if (keyboard_check_pressed(vk_f5))
		window_set_fullscreen(!window_get_fullscreen());
#endregion
#region Delta Time

	global.delta_time_real = (60/1000000)*delta_time;
	global.delta_time_game = global.delta_time_real*global.delta_time_scale*!global.delta_time_paused;
#endregion
#region Camera
	camera_set_view_pos(view_camera[0], global.camera_x, global.camera_y);
	camera_set_view_size(view_camera[0], global.camera_w, global.camera_h);
#endregion




//if (dpad != undefined)
	//keyboard_key_release(dpad);
//dpad = choose(vk_up, vk_down, vk_left, vk_right);
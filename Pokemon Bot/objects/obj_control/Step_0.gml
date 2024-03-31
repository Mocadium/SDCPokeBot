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

if (!shiny_found) {
	if (!restart) {
		timer = sin(current_time/100);
	
		if (global.pokemon == undefined) {
			keyboard_key_release(vk_control);
			keyboard_key_release(ord("R"));
			if (timer >= 0) {
				keyboard_key_press(vk_numpad0);
			} else {
				keyboard_key_release(vk_numpad0);
			}
		} else {
			global.shiny_max = max(global.shiny_max, global.pokemon.shiny);
			global.shiny_min = min(global.shiny_min, global.pokemon.shiny);
			++global.encounters;
			array_insert(global.shiny_list, 0, global.pokemon.shiny);
			if (array_length(global.shiny_list) > 16)
				array_pop(global.shiny_list);
			if (global.pokemon.shiny >= 8) {
				timer = 60;
				restart = true;
			} else {
				shiny_found = true;
				exit;
			}
		}
	} else {
		if (timer-- <= 0) {
			keyboard_key_press(vk_control);
			keyboard_key_press(ord("R"));
			global.pokemon = undefined;
			restart = false;
		}
	}
}

//if (dpad != undefined)
	//keyboard_key_release(dpad);
//dpad = choose(vk_up, vk_down, vk_left, vk_right);
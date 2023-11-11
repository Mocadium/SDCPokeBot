#region Application
	if (global.debug) {
		draw_set_colour(c_white);
		draw_set_align(fa_left, fa_bottom);
		draw_text(0, view_hport[0], "DEBUG MODE");
		
		draw_set_align(fa_left, fa_top);
		draw_text(0, 0, "FPS: " + string(fps));
		draw_text(0, 16, "FPS REAL: " + string(fps_real));
		draw_text(0, 32, "DELTA TIME (REAL): " + string(global.delta_time_real));
		draw_text(0, 48, "DELTA TIME (GAME): " + string(global.delta_time_game));
		draw_text(0, 64, "DELTA TIME (GAME): " + string(global.delta_time_game));
		draw_text(0, 80, "TIME SCALE: " + string(global.delta_time_scale));
		draw_text(0, 96, "TIME PAUSED: " + string(global.delta_time_paused));
	}
#endregion
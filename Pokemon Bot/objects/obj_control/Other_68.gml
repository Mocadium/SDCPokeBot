switch(async_load[? "type"]) {
	case network_type_data:
		buffer = async_load[? "buffer"];
		var _header = buffer_read(buffer, buffer_string);
		var _data = buffer_read(buffer, buffer_string);
		
		switch(_header) {
			case 0:
				#region Data Parsing
					var _pid = bin_to_dec(_data, 0, 4);
					var _otid = bin_to_dec(_data, 4, 4);
					var _p_nickname = "";
					for (var i=8; i<18; ++i) {
						var _char = bin_to_dec(_data, i, 1);
						_p_nickname += global.char_map[_char];
					}
					//LANGUAGE var _p_language = bin_to_dec(_data, 18, 1);
					//EGG var _p_egg = bin_to_dec(_data, 19, 1);
					var _p_trainer = "";
					for (var i=20; i<27; ++i) {
						var _char = bin_to_dec(_data, i, 1);
						_p_trainer += global.char_map[_char];
					}
					var _p_markings = bin_to_dec(_data, 27, 1);
					//CHECKSUM var _p_checksum = bin_to_dec(_data, 28, 2);
					
					#region Data
						var _data_key = _otid ^ _pid;
						var _d1 = pokemon_data_extract(_data, 32, _data_key);
						var _d2 = pokemon_data_extract(_data, 44, _data_key);
						var _d3 = pokemon_data_extract(_data, 56, _data_key);
						var _d4 = pokemon_data_extract(_data, 68, _data_key);
						var _data_pos = _pid mod 24;
						var _data_order = [[_d1, _d2, _d3, _d4], [_d1, _d2, _d4, _d3], [_d1, _d3, _d2, _d4], [_d1, _d4, _d2, _d3], [_d1, _d3, _d4, _d2], [_d1, _d4, _d3, _d2],
										   [_d2, _d1, _d3, _d4], [_d2, _d1, _d4, _d3], [_d3, _d1, _d2, _d4], [_d4, _d1, _d2, _d3], [_d3, _d1, _d4, _d2], [_d4, _d1, _d3, _d2],
										   [_d2, _d3, _d1, _d4], [_d2, _d4, _d1, _d3], [_d3, _d2, _d1, _d4], [_d4, _d2, _d1, _d3], [_d3, _d4, _d1, _d2], [_d4, _d3, _d1, _d2],
										   [_d2, _d3, _d4, _d1], [_d2, _d4, _d3, _d1], [_d3, _d2, _d4, _d1], [_d4, _d2, _d3, _d1], [_d3, _d4, _d2, _d1], [_d4, _d3, _d2, _d1]];
						
						
						#region Growth
							var _data_g = _data_order[_data_pos][0];
							var _p_species = bin_to_dec(_data_g, 0, 2);
						#endregion

					#endregion
					
					var _p_status = bin_to_dec(_data, 80, 4);
					var _p_level = bin_to_dec(_data, 84, 1);
					//POKERUS
					//CURRENT HP
					var _p_hp_total = bin_to_dec(_data, 88, 2);
					var _p_atk = bin_to_dec(_data, 90, 2);
					var _p_def = bin_to_dec(_data, 92, 2);
					var _p_spd = bin_to_dec(_data, 94, 2);
					var _p_sp_atk = bin_to_dec(_data, 96, 2);
					var _p_sp_def = bin_to_dec(_data, 98, 2);
				#endregion
				global.pokemon = new Pokemon(_pid,
											 _otid,
											 _p_nickname,
											 _p_trainer,
											 _p_markings,
											 _p_species,
											 _p_status,
											 _p_level,
											 _p_hp_total,
											 _p_atk,
											 _p_def,
											 _p_spd,
											 _p_sp_atk,
											 _p_def);
			break;	
		}
	break;
}
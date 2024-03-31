function Pokemon(_pid, _otid, _nickname, _trainer, _markings, _species, _status, _level, _hp_total, _atk, _def, _spd, _sp_atk, _sp_def) constructor {
	pid = _pid;
	otid = _otid;
	nickname = _nickname;
	trainer = _trainer;
	markings = _markings;
	species = _species;
	status = _status;
	level = _level;
	hp_total = _hp_total;
	atk = _atk;
	def = _def;
	spd = _spd;
	sp_atk = _sp_atk;
	sp_def = _sp_def;
	
	#region Shininess
		var _otid_b = dec_to_bin(otid, 4);
		var _tid = bin_to_dec(_otid_b, 0, 2);
		var _sid = bin_to_dec(_otid_b, 2, 2);
		var _p1 = pid div 65536;
		var _p2 = pid mod 65536;
		
		shiny = _tid ^ _sid ^ _p1 ^ _p2;
	#endregion
}

function pokemon_data_extract(_data, _address, _key) {
	var _n1 = dec_to_bin(bin_to_dec(_data, _address  , 4, false) ^ _key, 4);
	var _n2 = dec_to_bin(bin_to_dec(_data, _address+4, 4, false) ^ _key, 4);
	var _n3 = dec_to_bin(bin_to_dec(_data, _address+8, 4, false) ^ _key, 4);
	var _data_d = _n1 + _n2 + _n3;
	
	return _data_d;
}
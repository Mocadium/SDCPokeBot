function draw_set_align(_halign, _valign) {
	draw_set_halign(_halign);
	draw_set_valign(_valign);
}

function array_find(_array, _n) {
	for (var i=0; i<array_length(_array); ++i) {
		if (_array[i] == _n)
			return i;
	}
	return undefined;
}

function bin_to_dec(_str, _start, _bytes) {
	var _index = (_start*8)+1;
	var _length = _bytes*8;
	var _bstring = string_copy(_str, _index, _length);
	
	//Reverse (Little Endian)
	var _tempstr = "";
	for (var i=_bytes-1; i>=0; --i) {
		_tempstr += string_copy(_bstring, 1+(i*8), 8);
	}
	_bstring = _tempstr;
	
	//Convert to Decimal
	var _n = 0;
	for (var i=0; i<_length; ++i) {
		var _bit = real(string_char_at(_bstring, _length-i))
		
		_n += _bit*power(2, i);
	}
	return _n;
}

function dec_to_bin(num, _bytes) {
	var _length = _bytes*8;
    var _bstring = "";
    
	//Convert to Binary
    for (var i=_length-1; i>=0; --i) {
		var _bit = (num >> i) & 1;
        _bstring += string(_bit);
	}
	
	//Reverse (Little Endian)
	var _tempstr = "";
	for (var i=_bytes-1; i>=0; --i) {
		_tempstr += string_copy(_bstring, 1+(i*8), 8);
	}
	_bstring = _tempstr;
    
    return _bstring;
}
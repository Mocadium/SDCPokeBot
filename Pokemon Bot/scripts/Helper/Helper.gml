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
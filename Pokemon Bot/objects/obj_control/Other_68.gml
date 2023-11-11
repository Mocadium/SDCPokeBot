switch(async_load[? "type"]) {
	case network_type_data:
		buffer = async_load[? "buffer"];
		var _header = buffer_read(buffer, buffer_string);
		var _data = buffer_read(buffer, buffer_string);
		
		show_debug_message(_data);
	break;
}
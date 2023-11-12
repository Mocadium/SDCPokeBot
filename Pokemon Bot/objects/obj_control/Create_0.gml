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
#region Encoding Maps
global.char_map = 
[
" ","À","Á","Â","Ç","È","É","Ê","Ë","Ì"," ","Î","Ï","Ò","Ó","Ô",
"Œ","Ù","Ú","Û","Ñ","ß","à","á"," ","ç","è","é","ê","ë","ì"," ",
"î","ï","ò","ó","ô","œ","ù","ú","û","ñ","º","ª","ᵉʳ","&","+"," ",
" "," "," "," ","Lv","=",";"," "," "," "," "," "," "," "," "," ",
" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," ",
"▯","¿","¡","PK","MN","PO","Ké","??","??","??","Í","%","(",")"," "," ",
" "," "," "," "," "," "," "," ","â"," "," "," "," "," "," ","í",
" "," "," "," "," "," "," "," "," ","⬆","⬇","⬅","➡","*","*","*",
"*","*","*","*","ᵉ","<",">"," "," "," "," "," "," "," "," "," ",
" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," ",
"ʳᵉ","0","1","2","3","4","5","6","7","8","9","!","?",".","-","・",
"…","“","”","‘","’","♂","♀","$",",","×","/","A","B","C","D","E",
"F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U",
"V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k",
"l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","▶",
":","Ä","Ö","Ü","ä","ö","ü"," "," "," "," "," "," "," "," ",""];
#endregion


//dpad = undefined;
global.pokemon = undefined;
restart = false;
shiny_found = false;
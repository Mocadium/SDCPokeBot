draw_set_font(fnt_main);

draw_set_color(c_white);
draw_text(0, 0, global.encounters);

draw_set_color(c_red);
draw_text(0, 10, global.shiny_max);
draw_set_color(c_lime);
draw_text(0, 20, global.shiny_min);

if (global.pokemon != undefined) {
	draw_set_color(c_white);
	draw_text(0, 40, global.pokemon.nickname);
	draw_text(0, 50, global.pokemon.shiny);
	
	draw_sprite(spr_pokemon, global.pokemon.species, 0, 60);
}

draw_set_color(c_white);
for (var i=0; i<array_length(global.shiny_list); ++i) {
	draw_text(room_width*0.9, i*10, global.shiny_list[i]);
}
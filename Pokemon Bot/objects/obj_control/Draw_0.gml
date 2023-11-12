draw_set_font(fnt_main);

if (global.pokemon != undefined) {
	draw_text(0, 0, global.pokemon.nickname);
	draw_text(0, 10, global.pokemon.shiny);
	
	draw_sprite(spr_pokemon, global.pokemon.species, 10, 10);
}
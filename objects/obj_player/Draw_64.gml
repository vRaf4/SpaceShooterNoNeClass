//Se debug for true:
if(global.debug) {
	//Desenhando o level do tiro:
	draw_text(95, 70, "Lvl do tiro: " + string(level_tiro));
}

//Atividade: Desenhe a palavra vida, na base da janela:
var _altura_tela = display_get_gui_height();//Pegando a altura da janela;

//Se não tiver transição ele desenha:
if(!global.transicao) {
	//Desenhando a GUI:
	_desenhar_GUI(spr_vida, vidas, _altura_tela - 20);
	_desenhar_GUI(spr_escudo, escudos, _altura_tela - 45);
	draw_text(room_width / 2, 100, global.pontos);
}

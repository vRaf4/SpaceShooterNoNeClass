//Atividade: Pegar a dimensão da tela
//E desenhar no meio da tela;
var vh = window_get_height() / 2.5;//Pega a metade da tela;
draw_set_font(fnt_Menu_1);

//Centralizando o menu:
draw_set_valign(fa_center);

//Usando o for para desenhar todas as opções do menu:
//O for usa um indice; uma condição; e uma ação;
//O indice começa com valor 0;
//A condição é enquanto o i for menor que 3;
//Ao repetir vai aumentar o i em mais 1;

//Enquanto i for menor que o tamanho do array:
for (var i = 0; i < array_length(menu); i++) {
	//Variável da cor:
	var _cor = c_white;
	//Se o i for igual a atual:
	if(i == menu_atual) {
		_cor = c_red;//Vai ficar vermelho;
	}
	draw_set_colour(_cor);
	//Desenhando a opção de jogar na tela:
	draw_text(20, vh + i * 45, menu[i]);
	
	draw_set_colour(-1);
}
draw_set_valign(-1);
draw_set_font(-1);
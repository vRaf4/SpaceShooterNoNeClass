//Atividade: Pegar a dimensão da tela
//E desenhar no meio da tela;
var vh = window_get_height() / 2;//Pega a metade da tela;

//Centralizando o menu:
draw_set_valign(fa_center);

//Usando o for para desenhar todas as opções do menu:
//O for usa um indice; uma condição; e uma ação;
//O indice começa com valor 0;
//A condição é enquanto o i for menor que 3;
//Ao repetir vai aumentar o i em mais 1;

//Enquanto i for menor que o tamanho do array:
for (var i = 0; i < array_length(menu); i++) {
	//Desenhando a opção de jogar na tela:
	draw_text(20, vh + i * 20, menu[i]);
}
draw_set_valign(-1);
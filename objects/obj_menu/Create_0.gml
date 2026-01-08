//Vai ter 3 opções:
//Jogar, tutorial e sair;

//Criando o array para as opções do menu:

menu = ["JOGAR", "TUTORIAL", "LOJA", "SAIR"];

menu_atual = 0;

margem = 0;
//Tocando a musica:
_toca_som_sfx(snd_fundo_inicio);

controlar_menu = function() {
	var _subir = keyboard_check_pressed(vk_up);
	var _descer = keyboard_check_pressed(vk_down);
	var _w = keyboard_check_pressed(ord("W"));
	var _s = keyboard_check_pressed(ord("S"));
	//Se for maior que 0 e menor que o tamanho do array:
	if(_subir or _w){
		menu_atual--;//Aumentar o valor do menu;
		margem = 0;
		_toca_som_sfx(sfx_twoTone);
	} 
	if(_descer or _s){
		menu_atual++;//Diminui o valor do menu
		_toca_som_sfx(sfx_twoTone);
	}
	//Limita o valor entre 0 e 2:
	menu_atual = clamp(menu_atual, 0, array_length(menu)-1);
	margem = lerp(margem, 30, .1);
	
	ativa_menu();
}

ativa_menu = function(){
	//Se a pessoa apertar o enter:
	if(keyboard_check_pressed(vk_enter)){
		switch(menu_atual) {
			case 0: //Vai para o jogo:
				//Cria no centro da room:
				_criar_transicao_1();
				global.destino = rm_jogo;
				global.transicao = true;//Transição acontecendo;
			break;
			case 1: //Vai para o tutorial:				
				_criar_transicao_1();
				global.destino = rm_tutorial;
				global.transicao = true;//Transição acontecendo;
			break;
			case 2:
				_criar_transicao_1();
				global.destino = rm_loja;
				global.transicao = true;//Transição acontecendo;
			break;
			case 3: //Fecha o jogo:
				game_end();
			break;
		}
	}
}

desenhar_menu = function() {
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
		//Variavel da margem:
		var _margem = 0;
		//Se o i for igual a atual:
		if(i == menu_atual) {
			_cor = c_red;//Vai ficar vermelho;
			_margem = margem;
		}
		draw_set_colour(_cor);
		//Desenhando a opção de jogar na tela:
		draw_text(20 + _margem, vh + i * 45, menu[i]);
	
		draw_set_colour(-1);
	}
	draw_set_valign(-1);
	draw_set_font(-1);
}


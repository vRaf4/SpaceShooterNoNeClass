//Vai ter 3 opções:
//Jogar, tutorial e sair;

//Criando o array para as opções do menu:

menu = ["JOGAR", "TUTORIAL", "SAIR"];

menu_atual = 0;

alternando_opcoes_menu = function() {
	var _subir = keyboard_check_pressed(vk_up);
	var _descer = keyboard_check_pressed(vk_down);
	var _w = keyboard_check_pressed(ord("W"));
	var _s = keyboard_check_pressed(ord("S"));
	//Se for maior que 0 e menor que o tamanho do array:
	if(_subir or _w){
		menu_atual--;//Aumentar o valor do menu;
		_toca_som_sfx(sfx_twoTone);
	} 
	if(_descer or _s){
		menu_atual++;//Diminui o valor do menu
		_toca_som_sfx(sfx_twoTone);
	}
	//Limita o valor entre 0 e 2:
	menu_atual = clamp(menu_atual, 0, array_length(menu)-1);
	show_debug_message(menu_atual);
}
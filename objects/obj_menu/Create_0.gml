//Vai ter 3 opções:
//Jogar, tutorial e sair;

//Criando o array para as opções do menu:

menu = ["JOGAR", "TUTORIAL", "SAIR"];

menu_atual = 0;

alternando_opcoes_menu = function() {
	var _subir = keyboard_check_released(vk_up);
	var _descer = keyboard_check_released(vk_down);
	//Se for maior que 0 e menor que o tamanho do array:
		if(_subir && menu_atual > 0){
			menu_atual--;//Aumentar o valor do menu;
		} 
		if(_descer && menu_atual < 2){
			menu_atual++;//Diminui o valor do menu
		}
	show_debug_message(menu_atual);
}
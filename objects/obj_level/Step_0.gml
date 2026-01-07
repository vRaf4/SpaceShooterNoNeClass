//Reiniciando o jogo:
if(keyboard_check(vk_escape)){
	_criar_transicao_1();
	//Avisando que está tendo transição:
	global.transicao = true;
}
if(global.level <= 1) {
	if (global.pontos >= _pontos) {
		_ir_para_prox_level();
	} 
} else {
		//Vai para tela de win:
		global.destino = rm_win;
		_criar_transicao_1();
		global.transicao = true;
		
	}
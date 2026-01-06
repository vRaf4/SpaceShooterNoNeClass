vida_inimigo = 3;
//Descobrindo se ele foi criado na sequencia:
criado_na_sequence = in_sequence;
randomise();
_inicia_efeito_mola();
_inicia_efeito_shader();
//Criando o alarme:
alarm[0] = game_get_speed(gamespeed_fps) * 2;

_morrendo = function() {
	_timer_efeito_shader(3);
	vida_inimigo -= 0.6;
	_efeito_mola(1.3, 1.5);
	_screen_shake(5);
	if(vida_inimigo < 1) {
		_efeito_explosao(obj_explosao_inimigo);
		_screen_shake(10);
		_toca_som_sfx(sfx_explosao2);
	}		
}
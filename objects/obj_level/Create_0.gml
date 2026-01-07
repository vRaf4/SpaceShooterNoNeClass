//Criando a lista de ondas:

_onda1 = [seq_onda1, seq_onda2, seq_onda1_inimigo2];
_onda2 = [seq_onda2_a, seq_onda2_b, seq_onda2_c];
_onda3 = [seq_onda2, seq_onda1_inimigo2, seq_onda2_a, seq_onda2_c];
_onda_atual = _onda1;
_total_ondas = [_onda1, _onda2, _onda3];
//Array: seq_onda1, seq_onda2, seq_onda2_b,
_indice = 0;
_indice_ondas = 0;
_pontos = 30;

//Criando o alarme: 
alarm[0] = 60;


alarm[1] = game_get_speed(gamespeed_fps) * 6;

//Método para trocar de level
_ir_para_prox_level = function() {
	if (_indice_ondas < 3){   
		_indice_ondas+= 1;
		//Enquanto for menor que o array:
		if(_indice_ondas <= array_length(_total_ondas) -1) {
			_onda_atual = _total_ondas[_indice_ondas];//A onda atual recebe a proxima;
			_pontos *= 2;//Dobra a quantidade de pontos;
			global.level+=1;//Aumenta um level;
		}
	} else {
		//Vai para tela de win:
		global.destino = rm_win;
		_criar_transicao_1();
		global.transicao = true;
		
	}
	show_debug_message(_indice_ondas);
}
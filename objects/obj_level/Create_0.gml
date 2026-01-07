//Criando a lista de ondas:

_onda1 = [seq_onda1, seq_onda2, seq_onda1_inimigo2];
_onda2 = [seq_onda2_b, seq_onda2_inimigo2];
_onda_atual = _onda1;
//Array: seq_onda1, seq_onda2, seq_onda2_b,
_indice = 0;
_pontos = 30;

//Criando o alarme: 
alarm[0] = 60;


alarm[1] = game_get_speed(gamespeed_fps) * 6;

//Método para trocar de level
_ir_para_prox_level = function() {
	global.level+=1;//Aumenta um level:
	_onda_atual = _onda2;//A onda atual recebe a proxima;
	_pontos *= 2;//Dobra a quantidade de pontos;
	show_debug_message(global.level);
}
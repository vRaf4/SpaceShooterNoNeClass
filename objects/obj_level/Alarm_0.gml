//Se for menor que o tamanho o aray:
if (_indice < array_length(_onda_atual)) {
	//Criando a sequencia:
	layer_sequence_create("seq_Inimigos", 0 ,0, _onda_atual[_indice]);
	//Quando tocar o alarme ele aumentar o indice;
	_indice++;
	//show_debug_message(_indice);
	//Reiniciar o alarme e criar a próxima onda:
	alarm[0] = 510;
} else {
	var _metade_tela = 144;
	var _tela_inteira = 288;
	var _posX_1 = irandom_range(0, _metade_tela);
	var _posx_2 = irandom_range(_metade_tela, _tela_inteira);
	var _posY = -48;
	var _posX = _posX_1;
	//Vai criar dois inimigos 3;
	repeat(2) {	
		instance_create_layer(_posX, y + _posY, "Inimigos", obj_inimigo3);
		_posX = _posx_2;
		_posY -= 50;
	}
	//Reiniciando a fase:
	_indice = 0;
	alarm[0] = 510;
}

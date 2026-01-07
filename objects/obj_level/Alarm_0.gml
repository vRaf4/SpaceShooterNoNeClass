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
	var _posX = 48;
	var _posY = -48;	
	//Vai criar dois inimigos 3;
	repeat(2) {	
		instance_create_layer(x + _posX, y + _posY, "Inimigos", obj_inimigo3);
		_posX += 200;
		_posY -= 50;
	}
	//Reiniciando a fase:
	_indice = 0;
	alarm[0] = 510;
}

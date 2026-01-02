//Criando a sequencia:
layer_sequence_create("seq_Inimigos", 0 ,0, _ondas[_indice]);

//Se for menor que o tamanho o aray:
if (_indice < array_length(_ondas) - 1) {
	//Quando tocar o alarme ele aumentar o indice;
	_indice++;
	//show_debug_message(_indice);
	//Reiniciar o alarme e criar a próxima onda:
	alarm[0] = 510;
} else {
	_indice = 0;	
	alarm[0] = 510;
}

vida_inimigo = 3;
//Descobrindo se ele foi criado na sequencia:
criado_na_sequence = in_sequence;
randomise();

//Criando o alarme:
alarm[0] = game_get_speed(gamespeed_fps) * 2;

_morte_inimigo = function() {
	_efeito_explosao(obj_explosao_inimigo);			
	//Chance de spawnar o power Up: 
	var _chance = random(100);//Número de 0 a 100;
	//Se a chance for maior que 90, ele spawna:
	if(_chance >= 90) {	
		//Criando o power up :
		instance_create_layer(x, y, "Level", obj_powerUp_tiro);
	}

}
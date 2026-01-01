//Overide: apaga o código do  objeto pai e vai poder reescrever um novo
//código no objeto filho;

vida = 10;

//Método para morrer e perder vida;
_morrendo = function() {
	vida -= .4;
	if(vida < 1) {
		_efeito_explosao(obj_explosao_inimigo);
	}
}

//Atirando:
alarm[0] = game_get_speed(gamespeed_fps) * random_range(1,2);
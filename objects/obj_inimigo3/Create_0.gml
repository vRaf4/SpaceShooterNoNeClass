//Overide: apaga o código do  objeto pai e vai poder reescrever um novo
//código no objeto filho;

vida = 10;
//Variável para controlar o estado:
estado = "chegando";

tempo_load = 90;
timer_load = 0;

//Método para morrer e perder vida;
_morrendo = function() {
	vida -= .4;
	if(vida < 1) {
		_efeito_explosao(obj_explosao_inimigo);
	}
}

//Máquina de estado:
//State machine
_maquina_de_estado = function() {
	//Switch variável que é checada:
	switch(estado) {
		//Atividade: Enquanto o y for menor que 160
		//Ele vai ir para baixo;
		case "chegando":
			if(y < 160) {
				vspeed = 1.2;
			} else {// Y não é menor que 160;
				show_debug_message("Cheguei");
				//Troco o estado para cheguei;
				estado = "carregando";
			}				
		break//Parando o case;
		case "carregando":
			vspeed = 0;
			//Aumentando o valor do timer até chegar no tempo:
			timer_load++;
			//show_debug_message(timer_load);
			if(timer_load >= tempo_load) {
				//Quando o timer chegar no tempo ele muda o estado:
				show_debug_message("Atirou");
				estado = "Atirando";
			}
		break//parando o case;
			
	}
}

//Atirando:
//alarm[0] = game_get_speed(gamespeed_fps) * random_range(1,2);
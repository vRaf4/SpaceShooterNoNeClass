//Overide: apaga o código do  objeto pai e vai poder reescrever um novo
//código no objeto filho;

vida = 8;
//Variável para controlar o estado:
estado = "chegando";

tempo_load = 90;
timer_load = 0;
cont_tiro = 0;
decidi_dire = false;

//Efeitos: 
_inicia_efeito_mola();
_inicia_efeito_shader();

//Método para morrer e perder vida;
_morrendo = function() {
	vida -= .6;
	_screen_shake(5);
	_efeito_mola(1.5, 1.3);
	_timer_efeito_shader(3);
	if(vida < 1) {
		_efeito_explosao(obj_explosao_inimigo);
		_screen_shake(10);
		_toca_som_sfx(sfx_explosao2);
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
				//show_debug_message("Cheguei");
				//Troco o estado para cheguei;
				estado = "carregando";
			}				
		break//Parando o case;
		case "carregando":
			vspeed = 0;
			//Aumentando o valor do timer até chegar no tempo:
			timer_load++;
			if(timer_load >= tempo_load) {
				//Quando o timer chegar no tempo ele atira;:
				estado = choose("atirando", "atirando2");
				cont_tiro++;
				timer_load = 0;
			}
			//Se ele atirar 3 vezes:
			if(cont_tiro >= 5) {
				estado = "fugindo";//Vai para o estado fugindo;
			}
			break
		case "atirando" :
			//Atividade: Fazer ele checar se o player existe:
			if (instance_exists(obj_player)) {
				//Ele vai dar uma direção com o x/y inicial, e vai até o x/y do objeto selecionado;
				var _dir = point_direction(x, y, obj_player.x, obj_player.y);
				//Ele cria o tiro:
				var _tiro1 = instance_create_layer(x, y, "Tiro", obj_tiro1_inimigo3);
				_tiro1.speed = 4;
				_tiro1.direction = _dir;
				_tiro1.image_angle = _dir + 90;//mais 90 graus;
				//show_debug_message("Atirou");
				//Volta a carregar:
				_toca_som_sfx(sfx_laser1);
				_efeito_mola(1.3, 1.5);
				estado = "carregando";
			}
			break	
		case "atirando2" :
			//Atividade: Fazer ele checar se o player existe:
			if (instance_exists(obj_player)) {
				var _ang = 255;
				repeat(3) {
					//Ele cria o tiro:
					var _tiro2 = instance_create_layer(x, y, "Tiro", obj_tiro2_inimigo3);
					_tiro2.speed = 2;
					_tiro2.direction = _ang;
					_tiro2.image_angle = _ang + 90;
					//Aumenta o angulo:
					_ang += 15;
				}
				_toca_som_sfx(sfx_laser2);
				_efeito_mola(1.3, 1.5);
				//show_debug_message("Atirou");
				//Atividade: vai para o estado de fugindo, quando o contador
				//chegar em 3;
				timer_load = 0;
				//Volta a carregar:
				estado = "carregando";
			}
			break	
		case "fugindo": 
			//Se ele não decidiu a direção:
			if(decidi_dire == false) {
				hspeed = choose(-1, 1);
				decidi_dire = true;
			}
			vspeed = -1;
			//Atividade: destruir quando sair da tela:
			if(y < -32) {
				instance_destroy();
				show_debug_message("Destruiu");
			}
			break;
	}
}

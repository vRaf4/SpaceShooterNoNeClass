#region var Globais
global.debug = false;
global.destino = rm_inicio;
global.transicao = false;

#endregion

#region funções 
	//Efeito de explosão:
	function _efeito_explosao(_efeito = obj_explosao) {
		//Criando o efeito de explosão:
		var _explo = instance_create_layer(x, y, "Particulas", _efeito);
		_explo.image_angle = random(359);//Vai dar um angulo aleatório de até 
		//359 graus;
		//Destroi a instancia do tiro;
		instance_destroy();	
	}
	
	//Método de tiro: 
	function _tiro_inimigo(_obj_tiro = obj_tiro_inimigo1) {
	var _tiro = instance_create_layer(x, y, "Tiro", _obj_tiro);
	_tiro.vspeed = 4;
	_tiro.image_xscale = 1.2;
	_tiro.image_yscale = 1.2;
	_efeito_mola(1.5, 1.3);
	_toca_som_sfx(sfx_laser1);
}

	//Efeito screen shake:
	function _screen_shake(_tremor) {
		//Se a instancia existir:
		if(instance_exists(obj_screen_shake)) {
			//Checando se o valor do treme atual é maior que o treme do objeto;
			//Acessar o objeto:
			with(obj_screen_shake) {
				//Aqui meu código roda dentro do objeto;
				//Se o treme novo for maior do que o eu estou tremendo(treme velho):
				if(_tremor > treme) {
					//Eu mudo o valor dele; Caso contrário, não faço nada;
					treme = _tremor;
				}
			}
			//o treme do objeto vai receber o parâmetro da função:
			//obj_screen_shake.treme = _tremor;
		}
		else {
			return;
		}
	}
	
	function _inicia_efeito_mola(){
		xscale = 1;
		yscale = 1;
	}
	function _efeito_mola(_xscale, _yscale) {
		yscale = _yscale;
		xscale = _xscale;
	}
	function _efeito_voltar_a_mola(_qtd){
		yscale = lerp(yscale, 1, _qtd);
		xscale = lerp(xscale, 1, _qtd);
	}
	function _efeito_mola_desenhar(){
		draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
	}
	function _inicia_efeito_shader() {
		tomei_dano = 0;//false;
	}
	function _timer_efeito_shader(_dano){
		tomei_dano = _dano;//Qualquer número positivo é true pro gml;
	}
	function _contador_efeito_shader(){ 
		if(tomei_dano > 0) tomei_dano--;
	}
	function _desenha_efeito_shader(_funcao_desenho = draw_self) {
		//Se tomar dano: 
		if(tomei_dano) {
			//Iniciando efeito sombra: 
			shader_set(sh_branco);
			//Para não afetar a colisão quando aumentar a escala
			//precisamos criar uma variável para ser a escala, e se desenhar dessa forma:
			_funcao_desenho();
			//Resetando o shader:
			shader_reset();
		} else {
			_funcao_desenho();
		}
	}
	
	function _toca_som_sfx(_som,) {
		//Parando o som para não criar varias instancias:
		audio_stop_sound(_som);
		var _pitch = random_range(.7, 1.2);
		audio_play_sound(_som, 0, 0, , , _pitch);
	}
	
	function _criar_transicao_1() {
		layer_sequence_create("Transicao", room_width / 2, room_height / 2, seq_transicao_1);
	}
	function _criar_transicao_2() {
		layer_sequence_create("Transicao", room_width / 2, room_height / 2, seq_transicao_2);
	}
	function _troca_room(){	
		room_goto(global.destino);
	}
	function _fim_transicao(){
		global.transicao = false;
	}

#endregion
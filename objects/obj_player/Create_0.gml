#region Variáveis
vel_player = 2;//Velocidade do player;

espera_tiro = 8;
timer_tiro = 0;

level_tiro = 1;

vidas = 5;
escudos = 3;

meu_escudo = noone;

tempo_invencivel = game_get_speed(gamespeed_fps);
timer_i = 0;

_inicia_efeito_mola();
_inicia_efeito_shader();
//Parando todos os sons:
audio_stop_all();
//Iniciando a musica:
audio_play_sound(musica_fundo, 0, 1);

//Criar um timer de invencibilidade de 1 segundo;
//O player só pode perder vida se ele não está invencivel;
//Ele não está invencivel se o timer de invencibilidade for <= 0;
#endregion

#region Métodos
//Sistema de movimentação do player:
//Criando o método:
controla_player = function (){
	//Diminuindo o timer de invencibilidade:
	timer_i--;
	//Pegando as teclas:
	var _cima, _baixo, _esq, _dire, _atirar;
	//Pra cima, é a letra W ou Cima:
	_cima = keyboard_check(ord("W")) or keyboard_check(vk_up);//ord serve para pegar qualquer letra(Tem que ser em maiuculo)
	//Atividade: Pegar as demais teclas:
	_baixo = keyboard_check(ord("S")) or keyboard_check(vk_down);//Para baixo;
	_esq = keyboard_check(ord("A")) or keyboard_check(vk_left); //Para esquerda;
	_dire = keyboard_check(ord("D")) or keyboard_check(vk_right); //Para direita;
	_atirar = keyboard_check(vk_space) or mouse_check_button(mb_left); //Para atirar;
	//Outra forma de fazer a movimentação:
	//Velocidade horizontal:
	// 1 - 0 = 1 * vel_player = 2;
	// 0 - 1 = -1 * vel_player = -2;
	// 0 - 0 = 0 * vel_player = 0;
	// 1 - 1 = 0 * vel_player = 0;
	var _velh = (_dire - _esq) * vel_player;
	//Atividade: Fazer a movimentação vertical:
	//Primeiro vai o valor positivo:
	var _velv = (_baixo - _cima) * vel_player;
	//x e y vão receber a velocidade:
	x += _velh;
	y += _velv;	
	
	//Diminuindo o timer do tiro:
	timer_tiro--;//A cada step, diminui 1; Então ele vai atirar em 8 a 8 frames;
	
	//Desafio: Fazer o tiro sair quando apertar a tecla do tiro:
	//Ele vai cirar o tiro na sua posição;
	if(_atirar and timer_tiro <= 0) {
		//Mudando a escala quando atirar:
		_efeito_mola(1.3, 1.5);
		//Executando o método do tiro:
		if(level_tiro == 1) {//Se level for 1:
			//Vai executar o tiro 1;
			_tiro_1();
			timer_tiro = espera_tiro;
		} else if(level_tiro == 2) {//Se for 2:
			_tiro_2();//Executa o tiro 2;
			timer_tiro = espera_tiro * 1.3;//Mas aumenta um pouco o 
			//tempo de espera;
		} else if(level_tiro == 3) {
			_tiro_3();
			timer_tiro = espera_tiro * 1.6;
		}
	}
	//Limitando o player para não sair da tela::
	y = clamp(y, 15, room_height - 15);
	x = clamp(x, 15, room_width - 15);
	//A função clamp limita a posição do y ou x;
	
	com_escudo();


}
//Criando o método do tiro:
_tiro_1 = function (_obj_tiro = obj_tiro_player){
	//Salvando a instância do tiro criado:
		var _tiro = instance_create_layer(self.x, self.y, "Tiro", _obj_tiro);
		//Vai estar salvo nessa variável;
		_tiro.direction = 90;//Direção = 90 graus;
		//_tiro.speed = 10;
		//_tiro.image_xscale = 1.3;
		//_tiro.image_yscale = 1.3;
		//Som:
		_toca_som_sfx(sfx_laser1);
}
//Atividade: Criar o tiro 2:
//Tiro 2:
_tiro_2 = function () {
		//Salvando a instância do tiro criado:
		var _tiro = instance_create_layer(x - 13, y, "Tiro", obj_tiro_player);
		
		//Vai estar salvo nessa variável;
		_tiro.direction = 90;//Direção = 90 graus;
		//_tiro.speed = 10;
		//_tiro.image_xscale = 1.5;
		//_tiro.image_yscale = 1.5;
		
		_tiro = instance_create_layer(x + 13, y, "Tiro", obj_tiro_player);
		//_tiro.vspeed = -10;
		//_tiro.image_xscale = 1.1;
		//_tiro.image_yscale = 1.1;
		//som: 
		_toca_som_sfx(sfx_laser2);
}
//Tiro 3:
_tiro_3 = function () {
	//O tiro 3 vai ser o 1 e o 2 juntos;
	_tiro_1();
	_tiro_2();	
	_toca_som_sfx(sfx_laser2);
	_toca_som_sfx(sfx_laser1);
}
//Método para ganhar level ao colidir com o powerUp:
_ganhar_level_tiro = function () {
	if(level_tiro < 3) {
		level_tiro+= 1;
	}
}
//Método para trocar o level do tiro:
_trocar_level_tiro = function() {
	//Se ele apertar shift:
	if (keyboard_check_pressed(vk_shift)) {
		//E for menor ou igual a 3:
		if(level_tiro < 3) {
			level_tiro++;//Vai subir um level com no máximo 3 leveis;
		}
	} else if (keyboard_check_pressed(vk_control)) {//Se apertar control:
		//E for maior que 0;
		if (level_tiro > 1) {
			//Ele diminui até no 1;
			level_tiro--;
		}
	}
}
//Atividade: Criar o método para desenhar a GUI para passar a sprite que vai ser desenhada, como parametro:
_desenhar_GUI = function(_sprite, _valores, _posicao_y) {
	var _posicao_x = 20;//Guardando a posição do x
	//Vai repetir X vezes:
	repeat(_valores) {
		//Desenhando 3 vezes a sprite:
		draw_sprite_ext(_sprite, 0, _posicao_x, _posicao_y, 1, 1, 0, c_white, 0.5);
		_posicao_x += 25;//Aumentando a posição do x
	}
}

//Atividade: Fazer o player perder 1 de vida quando apertar ENTER:
//E se a vida chegar a 0, ele se destrói;

_perder_vida = function() {
	//Se ele estiver maior que 0 e a instancia do escudo existir:
	if (timer_i > 0 or instance_exists(meu_escudo)) return;
	//Se tomar dano:
	_timer_efeito_shader(3);
	//Ele vai sair do código;
	//Se a vida for maior doque 0:
	if(vidas > 1) {
		//Diminui 1 de vida;
		vidas--;
		//Quando perder a vida, o tempo de invencibilidade aumenta:
		timer_i = tempo_invencivel;
		//Tremer a tela quando levar dano:
		//obj_screen_shake.treme = 20; Não é recomendado fazer assim, o certo seria fazer uma função;
		_screen_shake(20);
		_efeito_mola(1.5,1.3)
	} else {
		//A intância é destruida;
		_efeito_explosao(obj_explo_player);
		//instance_destroy();
		_screen_shake(50);
		_toca_som_sfx(sfx_explosion);
		_toca_som_sfx(sfx_lose);//Som de perder;
		_criar_transicao_1();
		global.transicao = true;
	}
}
//Método para criar oescudo:
com_escudo = function() { 
	//Escudo seguir o player:
	//Se a instancia existir:
	if(instance_exists(meu_escudo)) {
		//O x e o y do escudo, recebe o x e o y do player;
		meu_escudo.x = x;
		meu_escudo.y = y;
		//timer_i = 10;//Fica invencivel;
	}

}
//Atividade: Fazer perder 1 de escudo quando apertar E;
_usar_escudo = function() {
	//Se tiver escudo e a variável meu escudo for noone:
	if(escudos > 0 && meu_escudo == noone) {
		//Quando soltar a tecla E:
		if(keyboard_check_released(ord("E"))) {
			//Perde 1 escudo;
			escudos--;
			meu_escudo = instance_create_layer(x, y, "Escudo", obj_escudo_anim);
			meu_escudo.image_speed = 0.5;
			_toca_som_sfx(sfx_shieldUp);
		} 
	}
	//Atividade: Quando terminar a animação do escudo, ele tem que 
	//ficar parado na imagem final;
}

#endregion
// Funções vs Métodos em GML
// -------------------------
// Funções:
// - Criadas com "function nome() { }"
// - São globais, podem ser chamadas em qualquer objeto
// - Ideais para lógica reutilizável (ex: cálculos, utilitários)
//
// Métodos:
// - Criados atribuindo uma função a uma variável: var.metodo = function() { }
// - Pertencem ao objeto/estrutura onde foram definidos
// - Ideais para comportamentos específicos de instâncias (ex: mover player)
//
// Resumindo:
// Use funções para código compartilhado entre vários objetos.
// Use métodos para encapsular ações ligadas a um objeto específico.
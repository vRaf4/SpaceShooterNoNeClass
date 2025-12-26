vel_player = 2;//Velocidade do player;

espera_tiro = 8;
timer_tiro = 0;
//Sistema de movimentação do player:
//Criando o método:
controla_player = function (){
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
		//Salvando a instância do tiro criado:
		var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_player);
		//Vai estar salvo nessa variável;
		_tiro.direction = 90;//Direção = 90 graus;
		_tiro.speed = 10;
		_tiro.image_xscale = 2;
		_tiro.image_yscale = 2;
		//Avisando que o timer do tiro foi resetado;
		timer_tiro = espera_tiro;//Quando chegar a 0, ele vai receber de novo o tempo de espera; 
		//E vai voltar a diminuir novamente;
	}
	
	//Atividade: Impedir que o player saia da tela:
	//if (x <= 15) {
	//	x = 15;
	//} else if (x >= 272) {
	//	x = 272;
	//}
	//if (y <= 15) {
	//	y = 15;
	//} else if (y >= 500) {
	//	y = 500;
	//}
	//Outra maneira usando o clamp:
	y = clamp(y, 15, room_height - 15);
	x = clamp(x, 15, room_width - 15);
	//A função clamp limita a posição do y ou x;

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
}
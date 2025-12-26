vel_player = 2;//Velocidade do player;
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
	//Definindo um valor padrão para a velocidade:
	//para ele parar de se mover quando não estiver pressionando a tecla;
	//vspeed = 0;
	//hspeed = 0;
	
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
	//keyboard retorna um valor booleano;
//	if (_cima) { //Então se _cima for true(se ele clicou no W):
//		vspeed = -vel_player;//Ele sobe;
//	}
//	if(_baixo) vspeed = vel_player;//Ele desce;
//	if(_esq) hspeed = -vel_player;//Vai para esquerda
//	if(_dire) hspeed = vel_player;//Vai para direita;
//	if(_atirar) show_debug_message("Atirou")
//}

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
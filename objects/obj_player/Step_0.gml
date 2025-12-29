//Rodando o método:
controla_player();

//Se clicar no tab:
if (keyboard_check_released(vk_tab)) {
	//Inverte o valor de debug;
	global.debug = !global.debug;
}
//Executando o método para trocar o level do tiro:
_trocar_level_tiro();

//Executando o método para perder vida:
_perder_vida();
//Executando o método para perder escudo:
_usar_escudo();

//Escudo seguir o player:
//Se a instancia existir:
if(instance_exists(meu_escudo)) {
	//O x e o y do escudo, recebe o x e o y do player;
	meu_escudo.x = x;
	meu_escudo.y = y;
}

//Atividade: Mudar o valor do level do tiro;
//Se apertar para cima o level do tiro aumenta;
//Se eu apertei para baixo o level do tiro diminui;
//Criar um debug do level do tiro;
//Criar o debug no evento draw;
//Desenhar o level do tiro na tela;

//Atividade: Criar o objeto do level, e do power up do level do tiro;
//Fazer ele aparecer no level;
//Subir o level do tiro quando colidir com o power up;
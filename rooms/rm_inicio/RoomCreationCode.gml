//Criando a transição somente se ja estiver tendo uma transição:
if(global.transicao) {
	_criar_transicao_2();
}
//Explicando:
//A var global.transicao começa false,então não vai ter transição;
//Quando eu aperto esc no tutorial o ou no jogo, ela fica true
//E ai vai rodar a transição quando voltar para room inicio;
//E quando acabar a transição 2, ela inicia uma função que troca essa 
//variável transicao para false novamente, assim vai desenhar o menu;
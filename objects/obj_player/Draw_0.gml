//Se desenhando: 
//draw_self();

//Se tomar dano: 
if(tomei_dano) {
	//Iniciando efeito sombra: 
	shader_set(sh_branco);
	//Para não afetar a colisão quando aumentar a escala
	//precisamos criar uma variável para ser a escala, e se desenhar dessa forma:
	_efeito_mola_desenhar();
	//Resetando o shader:
	shader_reset();
} else {
	_efeito_mola_desenhar();
}


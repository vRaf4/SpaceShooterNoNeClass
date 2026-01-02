//Tremendo a tela:
//Alterando a posição x/y do viewport com base no valor treme;
if(treme > 0.1) {
	//Vai pegar um valor negativo e um positivo do treme;
	var _x = random_range(-treme, treme);
	var _y = random_range(-treme, treme);
	//Alterando a posição x do viewport:
	view_set_xport(view_current, _x);
	//view_current é uma variável interna que indica qual view 
	//está sendo desenhada naquele momento.
	//Alterando a posição y do viewport:
	view_set_yport(view_current, _y);
} else {//Cheguei perto de 0, eu zero o valor do treme:
	treme = 0;
	//Garatindo que a posição do view é zerado também:
	view_set_xport(view_current, 0);
	view_set_yport(view_current, 0);
}
//Parando de treme de pouquinho em pouquinho:
treme = lerp(treme, 0, .06);
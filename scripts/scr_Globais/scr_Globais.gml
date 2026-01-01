#region var Globais
global.debug = false;

#endregion

#region funções 
	
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
}

#endregion
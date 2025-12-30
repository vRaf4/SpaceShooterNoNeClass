#region var Globais

global.debug = false;

#endregion

#region funções 
	
	function _efeito_explosao(_layer = "Tiro", _efeito = obj_explosao) {
		//Criando o efeito de explosão:
		var _explo = instance_create_layer(x, y, _layer, _efeito);
		_explo.image_angle = random(359);//Vai dar um angulo aleatório de até 
		//359 graus;
		//Destroi a instancia do tiro;
		instance_destroy();	
	}

#endregion
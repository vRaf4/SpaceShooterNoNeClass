//Criando o alarme para atirar:

//Método de tiro: 
_tiro_inimigo1 = function() {
	var _tiro = instance_create_layer(x, y, "Inimigos", obj_tiro_inimigo1);
	_tiro.vspeed = 6;
	_tiro.image_xscale = 1.2;
	_tiro.image_yscale = 1.2;
}
//Criando o alarme:
alarm[0] = game_get_speed(gamespeed_fps) * 2;
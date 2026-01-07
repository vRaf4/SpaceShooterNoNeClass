//Usando o código do objeto pai:
event_inherited();
//Alterando a vida e os pontos:
vida_inimigo = 5;
pontos = 5;

//Tiro do inimigo:
_atirando = function() {
	if(instance_exists(obj_player)){
		var _dir = point_direction(x, y, obj_player.x, obj_player.y);
		var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_inimigo2);
		_tiro.vspeed = 3;
		_tiro.image_xscale = 1.5;
		_tiro.image_yscale = 1.5;
		_tiro.direction = _dir;
		_tiro.image_angle = _dir + 90;
		_efeito_mola(1.5, 1.3);
		_toca_som_sfx(sfx_laser1);
	}
}
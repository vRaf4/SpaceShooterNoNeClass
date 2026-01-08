//Quando o objeto for criado:
//Quero que ele escolha uma sprite:
_sprite = choose(spr_meteoro_1, spr_meteoro_2, spr_meteoro_3);

gravity = .01;//Pra ele cair sozinho
vida = 4;
//Método para detruir:
_destruindo = function() {
	vida -= 1;
	_efeito_mola(1.3, 1.5);
	_screen_shake(5);
	if(vida < 1) {
		_efeito_explosao(obj_explosao_inimigo);
		_screen_shake(10);
		_toca_som_sfx(sfx_explosao2);
		_spawn_item();
	}		
}
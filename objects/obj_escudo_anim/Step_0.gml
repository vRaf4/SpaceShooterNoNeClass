//Se a image_index for menor que 0.2, e a velocidade dela for menor do que 0:
if (image_index < 0.2 && image_speed < 0) {
	//Ela se destrói;
	instance_destroy();
	obj_player.meu_escudo = noone;//E meu_escudo volta a ser vazio;
	//show_debug_message("Destruiu");
}
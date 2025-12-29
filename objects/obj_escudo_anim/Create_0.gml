//Aumentando a escala:
image_xscale = 1.2;
image_yscale = image_xscale;

//Atividade: Fazer ele voltar a animação para trás;
//Chegar se a animação reversa acabou(image_index < 0.2)
//E a velocidade da animação está negativa(image_speed < 0 )
//Se os dois forem verdades, ele se destroi;

//Criando o alarme:
alarm[0] = game_get_speed(gamespeed_fps) * 2; //2 segundos;
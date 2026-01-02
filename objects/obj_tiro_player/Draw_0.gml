//Se desenhando: 
draw_self();

//Efeito de brilho:

//Muda a forma de como o computador processa as cores:
gpu_set_blendmode(bm_add);
//Desenhando a sprite do tiro novamente, um pouco mais transparente:
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 2, image_yscale * 2, image_angle, cor, 0.4);
//Voltando as cores normal:
gpu_set_blendmode(bm_normal);
//Criando a instancia:

var _posX = irandom_range(32, 225);

instance_create_layer(_posX, -64, "Inimigos", obj_meteoro);

alarm[1] = game_get_speed(gamespeed_fps) * 6;
//level_tiro += 1;
_ganhar_level_tiro();//Método para ganhar um level;
instance_destroy(obj_powerUp_tiro);//Destrói a instância;
obj_level.alarm[0] = game_get_speed(gamespeed_fps);//Vai criar outro depois do alarme;


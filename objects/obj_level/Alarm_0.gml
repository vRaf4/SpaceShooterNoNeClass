//Criando um valor aleatório pro x e pro y:
var _power_up_x = irandom_range(30, 254);
var _power_up_y = irandom_range(90, 350);

instance_create_layer(_power_up_x, _power_up_y, "Level", obj_powerUp_tiro);

tipo = choose("vida", "escudo", "tiro_duplo", "tiro_triplo", "speed");

switch(tipo) {
	case "vida":
		sprite_index = spr_powerUp_vida;
	break;
	case "escudo":
		sprite_index = spr_powerUp_escudo;
	break;
	case "tiro_duplo":
		sprite_index = spr_powerUp_5;
	break;
	case "tiro_triplo":
		sprite_index = spr_powerUp_1;
	break;
	case "speed":
		sprite_index = spr_powerUp_speed;
	break;
}


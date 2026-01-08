//Aumentando a vida ou o escudo do player quando colidir:
switch(tipo) {
	case "vida":
		with(obj_player){//No objeto player:
			//Se a vida for menor que 5:
			if(vidas < 5) {
				vidas++;//Aumenta em 1;
			}
		}
	break;
	case "escudo":
		with(obj_player){//No objeto player:
			//Se a vida for menor que 5:
			if(escudos < 5) {
				escudos++;//Aumenta em 1;
			}
		}
	break;
	case "tiro_duplo": //Aumenta o level do tiro para 2, se o level for menor que 3:
		if(global.level_tiro < 3){
			global.level_tiro = 2;
			global.trocou_level_tiro = true;//Vai avisar que trocou o tiro;
		}
	break;
	case "tiro_triplo"://Aumenta o level do tiro para 3:
		global.level_tiro = 3;
		global.trocou_level_tiro = true;
	break;
	case "speed": //Aumenta em .5 a velocidade do player;
		with(obj_player) {
			if(vel_player < 5){
				vel_player += .5;
			}
		}
	break;
}

event_inherited();//Usando o código do objeto pai;
//Aumentando a vida ou o escudo do player quando colidir:
if(tipo == "vida") {
	with(obj_player){//No objeto player:
		//Se a vida for menor que 5:
		if(vidas < 5) {
			vidas++;//Aumenta em 1;
		}
		
	}
} else {
	with(obj_player){//No objeto player;
		//Se escudo for menor que 5:
		if(escudos < 5){
			escudos++;//Aumenta em 1;
		}
	}
}

event_inherited();//Usando o código do evento pai;
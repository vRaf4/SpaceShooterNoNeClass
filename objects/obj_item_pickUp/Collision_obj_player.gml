//Aumentando a vida ou o escudo do player quando colidir:
if(tipo == "vida") {
	with(obj_player){
		if(vidas < 5) {
			vidas++;
		}
		
	}
} else {
	with(obj_player){
		if(escudos < 5){
			escudos++;
		}
	}
}

event_inherited();//Usando o código do evento pai;
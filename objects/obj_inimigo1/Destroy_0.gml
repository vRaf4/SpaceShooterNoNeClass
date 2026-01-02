//show_debug_message("Destruiu");	//Chance de spawnar o power Up: 
var _chance = random(100);//Número de 0 a 100;
//Se a chance for maior que 90, ele spawna:
if(_chance >= 90) {	
	//Criando o power up :
	instance_create_layer(x, y, "Level", obj_powerUp_tiro);
}
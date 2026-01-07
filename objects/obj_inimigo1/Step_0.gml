//Destruindo quando não está em sequecencia: 
if(!in_sequence && criado_na_sequence) {
	instance_destroy();
	//show_debug_message("Destruiu");
}

_efeito_voltar_a_mola(.2);
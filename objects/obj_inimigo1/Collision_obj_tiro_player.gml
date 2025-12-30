vida_inimigo -= 0.6;

if(vida_inimigo <= 0) {
	_morte_inimigo();
}

show_debug_message(vida_inimigo)
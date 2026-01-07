if (global.transicao == false) {
	layer_sequence_create("seq_win_lose", 0, 0, _sequencia);
	show_debug_message("Desenhou");
	global.transicao = true;
}
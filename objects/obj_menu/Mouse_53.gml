//Se o audio não estiver tocando quando clicar
if (!audio_is_playing(snd_fundo_inicio)) {
	//Ele começa a tocar;
    audio_play_sound(snd_fundo_inicio, 1, true);
}

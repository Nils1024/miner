// Use 'Sound1' because that is the name in your Assets
if (audio_exists(Sound1)) {
    if (!audio_is_playing(Sound1)) {
        audio_play_sound(Sound1, 1, true);
    }
}
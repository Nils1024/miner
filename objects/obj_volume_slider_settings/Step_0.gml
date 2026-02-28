// 1. Detect Click
if (mouse_check_button_pressed(mb_left)) {
    if (point_distance(mouse_x, mouse_y, x, y) < 20) {
        is_dragging = true;
    }
}

// 2. Handle Dragging
if (is_dragging) {
    x = mouse_x;
    x = clamp(x, gui_x, gui_x + width);    
    
    value = (x - gui_x) / width;
    
    // Update the volume of Sound1
    if (audio_exists(Sound1)) {
        audio_sound_gain(Sound1, value, 0);
    }

    // 3. Release
    if (mouse_check_button_released(mb_left)) {
        is_dragging = false;
    }
}
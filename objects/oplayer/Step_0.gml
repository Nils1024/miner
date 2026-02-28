
if (move_timer > 0) {
    move_timer -= 1;
}


if (!is_moving && move_timer <= 0) {
   
    var move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
    var move_y = keyboard_check(vk_down) - keyboard_check(vk_up);


    if ((move_x != 0 || move_y != 0) && !(move_x != 0 && move_y != 0)) {
        target_x = x + (move_x * grid_size);
        target_y = y + (move_y * grid_size);
        
        is_moving = true;
    }
} 


if (is_moving) {
    x += sign(target_x - x) * move_speed;
    y += sign(target_y - y) * move_speed;


    if (x == target_x && y == target_y) {
        is_moving = false;
        move_timer = move_delay; 
    }
}
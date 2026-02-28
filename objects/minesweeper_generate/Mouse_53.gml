if(!global.is_generated) {
    var mouse_grid_x = floor(mouse_x / 16);
    var mouse_grid_y = floor(mouse_y / 16);
    
    oplayer.x = mouse_grid_x * 16
    oplayer.y = mouse_grid_y * 16
    
    tilemap_set(objects_map_id, 34, mouse_grid_x, mouse_grid_y);
    
    gen_minesweeper()
    global.is_generated = true
} else {
	// Unreveal spot
}

function gen_minesweeper() {
    
    // Set bombs
    var placed = 0;
    
    var player_grid_x = floor(oplayer.x / 16);
    var player_grid_y = floor(oplayer.y / 16);

    while (placed < 15) {
        var x_bomb = irandom_range(0, tiles_width - 1);
        var y_bomb = irandom_range(0, tiles_height - 1);
        
        if (abs(x_bomb - player_grid_x) <= 2 && abs(y_bomb - player_grid_y) <= 2) {
            continue;
        }
        
        var key = string(x_bomb) + "_" + string(y_bomb);
        
        if (!variable_struct_exists(bomb_spots, key)) {
            bomb_spots[$ key] = true;
            tilemap_set(map_id, 0, x_bomb, y_bomb);
            placed++;
        }
    }
    
    // Set numbers
    for (var _x = 0; _x < tiles_width; _x++) {
        for (var _y = 0; _y < tiles_height; _y++) {
            var current_key = string(_x) + "_" + string(_y);
    
            if (!variable_struct_exists(bomb_spots, current_key)) {
                var bomb_count = 0;
                
                for (var dx = -1; dx <= 1; dx++) {
                    for (var dy = -1; dy <= 1; dy++) {
                        if (dx == 0 && dy == 0) continue;
                        
                        var check_x = _x + dx;
                        var check_y = _y + dy;
                        var neighbor_key = string(check_x) + "_" + string(check_y);
                        
                        if (variable_struct_exists(bomb_spots, neighbor_key)) {
                            bomb_count++;
                        }
                    }
                }
                
                if (bomb_count > 0) {
                    number_spots[$ current_key] = bomb_count;
                    tilemap_set(numbers_map_id, bomb_count, _x, _y);
                }
            }
        }
    }
}

var mouse_grid_x = floor(mouse_x / 16);
var mouse_grid_y = floor(mouse_y / 16);

if(!global.is_generated) {
    oplayer.x = mouse_grid_x * 16
    oplayer.y = mouse_grid_y * 16
    
    tilemap_set(objects_map_id, 34, mouse_grid_x, mouse_grid_y);
    
    gen_minesweeper()
    global.is_generated = true
} 

unreveal(mouse_grid_x, mouse_grid_y)



function gen_minesweeper() {
    
    // Set bombs
    var placed = 0;
    
    var player_grid_x = floor(oplayer.x / 16);
    var player_grid_y = floor(oplayer.y / 16);

    while (placed < global.bomb_amount) {
        var x_bomb = irandom_range(0, tiles_width - 1);
        var y_bomb = irandom_range(0, tiles_height - 1);
        
        if (abs(x_bomb - player_grid_x) <= 2 && abs(y_bomb - player_grid_y) <= 2) {
            continue;
        }
        
        var key = string(x_bomb) + "_" + string(y_bomb);
        
        if (!variable_struct_exists(bomb_spots, key)) {
            bomb_spots[$ key] = true;
            
            tilemap_set(traps_map_id, irandom_range(1, 3), x_bomb, y_bomb);
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
    
    // Set stones
    for (var _x = 0; _x < tiles_width; _x++) {
        for (var _y = 0; _y < tiles_height; _y++) {
            tilemap_set(walls_map_id, 1, _x, _y);
        }
    }
}

function unreveal(_x, _y) {
    var current_tile = tilemap_get(walls_map_id, _x, _y);
    if (current_tile != 1) {
        return;
    }
    
    tilemap_set(walls_map_id, 0, _x, _y);
    var current_key = string(_x) + "_" + string(_y);
    
    if (variable_struct_exists(bomb_spots, current_key)) {
        bomb_hit()
        return; 
    }
    
    // Stop at a number
    if (variable_struct_exists(number_spots, current_key)) {
        return; 
    }
    
    for (var dx = -1; dx <= 1; dx++) {
        for (var dy = -1; dy <= 1; dy++) {
            if (dx == 0 && dy == 0) {
                continue;
            }
            
            unreveal(_x + dx, _y + dy);
        }
    }
}

function bomb_hit() {
    
}

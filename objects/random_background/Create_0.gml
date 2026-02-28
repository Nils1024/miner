randomize(); 


var lay_id = layer_get_id("Ground");
var map_id = layer_tilemap_get_id(lay_id);


var tiles_wide = room_width / 16;
var tiles_high = room_height / 16;


for (var _x = 0; _x < tiles_wide; _x++) {
    for (var _y = 0; _y < tiles_high; _y++) {
        

        var random_tile = irandom_range(1, 5); 
        
 
        tilemap_set(map_id, random_tile, _x, _y);
    }
}
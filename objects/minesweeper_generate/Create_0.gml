randomize(); 

ground_layer_id = layer_get_id("Ground");
numbers_layer_id = layer_get_id("Numbers")
objects_layer_id = layer_get_id("Objects")
traps_layer_id = layer_get_id("Traps")
map_id = layer_tilemap_get_id(ground_layer_id);
numbers_map_id = layer_tilemap_get_id(numbers_layer_id)
objects_map_id = layer_tilemap_get_id(objects_layer_id)
traps_map_id = layer_tilemap_get_id(traps_layer_id)


tiles_width = room_width / 16;
tiles_height = room_height / 16;

global.is_generated = false
bomb_spots = {}
number_spots = {}

for (var _x = 0; _x < tiles_width; _x++) {
    for (var _y = 0; _y < tiles_height; _y++) {
        tilemap_set(map_id, 17, _x, _y);
    }
}
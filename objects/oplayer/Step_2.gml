#region move the view

var view_cam = view_camera[0];
var view_w = camera_get_view_width(view_cam);
var view_h = camera_get_view_height(view_cam);

var target_x = oplayer.x - (view_w / 2);
var target_y = oplayer.y - (view_h / 2);

var current_x = camera_get_view_x(view_cam);
var current_y = camera_get_view_y(view_cam);

var smooth_x = lerp(current_x, target_x, 0.1); 
var smooth_y = lerp(current_y, target_y, 0.1);

smooth_x = clamp(smooth_x, 0, room_width - view_w);
smooth_y = clamp(smooth_y, 0, room_height - view_h);


camera_set_view_pos(view_cam, floor(smooth_x), floor(smooth_y));

#endregion
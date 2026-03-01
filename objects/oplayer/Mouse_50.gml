
#region center view
    var halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
    var halfViewHeight = camera_get_view_height(view_camera[0]) / 2;

    var halfPlayerWidth = oplayer.sprite_width / 2;
    var halfPlayerHeight = oplayer.sprite_height / 2;

    var target_x = (oplayer.x + halfPlayerWidth) - halfViewWidth;
    var target_y = (oplayer.y + halfPlayerHeight) - halfViewHeight;

    camera_set_view_pos(view_camera[0], target_x, target_y);
#endregion
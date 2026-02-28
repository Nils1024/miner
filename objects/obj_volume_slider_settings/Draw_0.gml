draw_set_color(c_white);

// Draw "VOLUME" Title
draw_set_halign(fa_center);
draw_text(gui_x + (width / 2), y - 40, "VOLUME");
draw_set_halign(fa_left); 

// Draw the bar and the knob (Circle)
draw_line(gui_x, y, gui_x + width, y);
draw_circle(x, y, 10, false); 

// Draw percentage
var percentage = round(value * 100);
draw_text(gui_x + width + 10, y - 10, string(percentage) + "%");
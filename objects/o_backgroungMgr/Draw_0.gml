var y1 = 20;
var y2 = 200;
var y3 = 540-y2;
var y4 = 540-y1;
var y5 = 540
var x1 = 0;
var x2 = room_width
var color2 = make_color_rgb(32, 9, 12)
var color1 = make_color_rgb(23, 9, 14)
var color2 = make_color_rgb(6, 20, 38)
var color1 = make_color_rgb(6, 20, 38)
var color1 = make_color_rgb(200, 200, 160)
var color2 = make_color_rgb(200, 200, 160)
draw_set_color(color1);
draw_rectangle(x1, 0, x2, y1, false);
draw_rectangle_color(x1, y1, x2, y2, color1, color1, color2, color2, false);
draw_set_color(color2);
draw_rectangle(x1, y2, x2, y3, false);
draw_rectangle_color(x1, y3, x2, y4, color2, color2, color1, color1, false);
draw_set_color(color1);
draw_rectangle(x1, y4, x2, y5, false);


///@param frame,color
var frame_default = argument0;
var color = argument1;

if(change_room_frame_2 = -1){
	change_room_frame_2 = frame_default;
}
else{
	if(change_room_frame_2 > 0){
		change_room_frame_2--;
	}
}

draw_set_alpha(change_room_frame_2/frame_default);
draw_set_color(color);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(COLOR_DEFAULT);
draw_set_alpha(1);
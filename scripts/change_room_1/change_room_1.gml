///@param room,frame,color
var gotoroom = argument0;
var frame_default = argument1;
var color = argument2;

if(change_room_frame_1 = -1){
	change_room_frame_1 = frame_default;
}
else{
	change_room_frame_1--;
	if(change_room_frame_1 <= 0){
		room_change(gotoroom);
	}
}

draw_set_alpha(1-change_room_frame_1/frame_default);
draw_set_color(color);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(COLOR_DEFAULT);
draw_set_alpha(1);
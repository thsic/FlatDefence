///@param x,y,type,level,color,size,column

var marker_x = argument0;
var marker_y = argument1;
var enhancement_type = argument2;
var enhancement_level = argument3;
var token_color = argument4;
var token_size = argument5;
var token_column = argument6//一列に並べられるトークンの数


draw_set_color(token_color);
for(var i=0; i<enhancement_level; i++){
	var hoge = i
	repeat(5){
		if(hoge > token_column-1){
			hoge -= token_column;
		}
	}
	var token_x = 2 + marker_x + hoge*(token_size+1);
	var token_y = 2 + marker_y + floor(i*(1/token_column))*(token_size+1);
	switch(enhancement_type){
	case 0:
		draw_rectangle(token_x, token_y, token_x+token_size-1, token_y+token_size-1, false);
	break
	case 1:
		draw_circle(token_x+token_size/2, token_y+token_size/2, token_size/2, false);
	break
	case 2:
		draw_triangle(token_x, token_y+token_size, token_x+token_size/2, token_y, token_x+token_size, token_y+token_size, false)
	break
	}
}
draw_set_color(COLOR_DEFAULT);
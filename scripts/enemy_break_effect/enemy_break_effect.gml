///@param x,y,amount,color,time,size,speed,randomdirection
var _x = argument0;
var _y = argument1;
var _amount = argument2;
var _color = argument3;
var _time_default = argument4;
var _size_default = argument5;
var _speed_default = argument6;
var _direction_default = argument7;
var _attenuration = 0.2;


for(var i=0; i<_amount; i++){
	if(_direction_default = -1){
		var _direction = random(360);
	}
	else{
		var _direction = _direction_default+random_range(-10, 10);
	}
	var _time = _time_default+random_range(-4, 4);
	var _size = _size_default+random_range(-2, 2);
	var _speed = _speed_default+random_range(-0.3, 0.3);
	with(instance_create_layer(_x, _y, "Effects", o_effect)){
		type = 12;
		direction = _direction;
		effect_color = _color;
		time = _time;
		time_default = _time;
		size = _size;
		speed = _speed;
		attenuration = _attenuration;
	}
}

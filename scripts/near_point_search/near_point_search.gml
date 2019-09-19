///@param searchtype,x1,y1,obj/x2,y2,varmax
//type object 0 or array 1
var searchtype = argument0;
var x1 = argument1;
var y1 = argument2;
if(searchtype){
	var object = argument3;
}
else{
	var x2 = argument3;
	var y2 = argument4;
	var search_number_max = argument5;
}

var distance = 10000;
var nearest_distance = 10000;
for(var i=0; i<instance_number(object); i++){
	var object_id = instance_find(object, i);
}

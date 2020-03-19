///
if(room != r_title and room != r_stageSelect){
	for(var i=0; i<10; i++){
		if(surface_exists(global.usefulwindow_surface[i])){
			surface_free(global.usefulwindow_surface[i]);
		}
	}
}
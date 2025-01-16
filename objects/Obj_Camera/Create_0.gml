if CheckIfDuplicate() { exit; }

x = 0; y = 0;
	
view_width = 640;
view_height = 480;
window_scale = 2;

window_set_size(view_width*window_scale, view_height*window_scale);
alarm[0] = 1;

surface_resize(application_surface, view_width*window_scale, view_height*window_scale);
	
screenShake = 0;
screenShakeReduce = 1.5;
reduce = true;
if keyboard_check_pressed(vk_enter) {
	debug = !debug;
	var debugState = debug ? "enabled!" : "disabled";
	show_debug_message("Debug " + debugState);
}

if !debug { exit; }

with Obj_CaptchaScreen {
	for(var i = 1; i <= 2; i++) {
		if keyboard_check_pressed(ord(string(i)))
			lerpToSize = i;
	}
}
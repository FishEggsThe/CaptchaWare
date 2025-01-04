if keyboard_check_pressed(vk_enter) {
	debug = !debug;
	var debugState = debug ? "enabled!" : "disabled";
	show_debug_message("Debug " + debugState);
}
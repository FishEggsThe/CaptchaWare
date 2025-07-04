if keyboard_check_pressed(vk_enter) {
	debug = !debug;
	var debugState = debug ? "enabled!" : "disabled";
	show_debug_message("Debug " + debugState);
	if instance_exists(Obj_CaptchaScreen)
		Obj_CaptchaScreen.depth = debug ? 0 : -10;
}

if !debug { exit; }

if keyboard_check_pressed(vk_escape) {
	room_goto(Rm_Test);
}

for(var i = 1; i <= 3; i++) {
	if keyboard_check_pressed(ord(string(i)))
		SetGameSpeed(1 + (i-1)*0.5);
}
if keyboard_check_pressed(ord("4")) {
	with Obj_GameManager {
		var ltt = (livesToTake == 1 ? 4 : 1);
		livesToTake = ltt;
	}
}

if keyboard_check_pressed(ord("P")) {
	Obj_HighScoreManager.addScoreFirebase(100, "beepis")
}
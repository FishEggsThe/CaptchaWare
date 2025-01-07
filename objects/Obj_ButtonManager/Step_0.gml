// Making sure you can't click a button before the game starts
if instance_exists(Obj_GameManager) {
	with Obj_GameManager {
		if !(state == gameState || state == gameOverState) { exit; }
	}
}

// Checking if a button exists and is being touched
if instance_number(Obj_Button) <= 0 { exit; }
with Obj_Button { notHovering(); }
var nearestButton = instance_nearest(mouse_x, mouse_y, Obj_Button);
if !position_meeting(mouse_x, mouse_y, nearestButton) { exit; }

nearestButton.hover();
if mouse_check_button(mb_left) { nearestButton.check(); }
if mouse_check_button_pressed(mb_left) { nearestButton.checkPressed(); }
if mouse_check_button_released(mb_left) { nearestButton.checkReleased(); }
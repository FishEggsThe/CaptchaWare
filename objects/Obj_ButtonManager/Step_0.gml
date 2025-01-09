if !CheckIfCanInteract() { exit; }

// Checking if a button exists and is being touched
if instance_number(Obj_Button) <= 0 { exit; }
with Obj_Button { notHovering(); }
var nearestButton = instance_nearest(mouse_x, mouse_y, Obj_Button);
if !position_meeting(mouse_x, mouse_y, nearestButton) { exit; }

var check = mouse_check_button(mb_left);
var pressed = mouse_check_button_pressed(mb_left);
var released = mouse_check_button_released(mb_left);

nearestButton.hover();
if check { nearestButton.check(); }
if pressed { nearestButton.checkPressed(); }
if released { nearestButton.checkReleased(); }
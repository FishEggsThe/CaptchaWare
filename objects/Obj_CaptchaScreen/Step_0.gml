size = lerp(size, lerpToSize, 0.5);

for(var i = 0; i <= 9; i++) {
	if keyboard_check_pressed(ord(string(i)))
		lerpToSize = i;
}
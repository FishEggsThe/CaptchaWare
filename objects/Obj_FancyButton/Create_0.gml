// Just a button with a bit more visual flair so I don't have to do it every time
event_inherited();
imageSprite = Spr_Checkmark;

notHovering = function() {
	lerpToSize = 1;
};

hover = function() {
	lerpToSize = 1.2;
};

check = function() {
	lerpToSize = 0.7;
	
};
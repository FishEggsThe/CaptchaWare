event_inherited();

depth = -20;

notHovering = function() {
	color = c_white;
};

hover = function() {
	color = c_ltgray;
};

check = function() {
	color = c_gray;
};

checkPressed = function() {
	with Obj_GameManager {
		difficulty = 0;
		currRound = 0;
		playerScore = 0;
		playerLives = 4
		layer_sequence_play(currSequence.seqID);
	}
	
	instance_destroy(Obj_GoBack);
	instance_destroy();
};
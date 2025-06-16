if inGameState {
	if gameTimer > 0 {
		//var win = selectMicrogame.winCondition()
		//gameWon = win;
		if (gameWon && gameTimer > gameWonTimer) {
			gameTimer = gameWonTimer;
		}
		gameTimer -= GetGameSpeed();
	} else {
		// This should only run once since inGameState changes after this else statement
		with Obj_CaptchaScreen { lerpToSize = minSize; }
		
		var state = gameWon ? "WinResults" : "LoseResults";
		ChangeSequence(state);
	}
}
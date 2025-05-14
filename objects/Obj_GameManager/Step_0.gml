if inGameState {
	if gameTimer > 0 {
		var win = selectMicrogame.winCondition()
		gameWon = win;
		if (win && gameTimer > gameWonTimer) {
			gameTimer = gameWonTimer;
		}
		gameTimer-=GetGameSpeed();
	} else {
		with Obj_CaptchaScreen { lerpToSize = minSize; }
		
		var state = gameWon ? "WinResults" : "LoseResults";
		ChangeSequence(state);
	}
}
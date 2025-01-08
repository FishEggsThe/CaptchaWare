with Obj_GameManager {
	if gameWon {
		timeline_position = 0;
		timeline_index = Tl_BreakTime;
		state = breakState;
	} else {
		timeline_position = 0;
		if playerLives <= 0 {	
			state = gameOverState;
			gameOver = true;
			timeline_running = false;
			timeline_index = Tl_Startup;
		} else {
			timeline_index = Tl_BreakTime;
			state = breakState;
		}
	}
}
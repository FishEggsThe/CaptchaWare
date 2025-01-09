with Obj_GameManager {
	timeline_position = 0;
	if (!gameWon && playerLives <= 0) {
		layer_destroy_instances("Game_Instances");
		state = gameOverState;
		gameOver = true;
		timeline_running = false;
		timeline_index = Tl_Startup;
	} else if (currRound % 12 == 0 && difficulty < 3) {
		timeline_index = Tl_LevelUp;
		state = levelUpState;
	} else {
		timeline_index = Tl_BreakTime;
		state = breakState;
	}
}
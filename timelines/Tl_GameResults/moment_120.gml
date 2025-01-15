with Obj_GameManager {
	timeline_position = 0;
	// If you lost all your lives
	if (!gameWon && playerLives <= 0) {
		layer_destroy_instances("Game_Instances");
		instance_create_layer(room_width/2-80, room_height/2, "Instances", Obj_Retry);
		instance_create_layer(room_width/2+80, room_height/2, "Instances", Obj_GoBack);
		//show_debug_message(instance_number(Obj_TileDisappear));
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
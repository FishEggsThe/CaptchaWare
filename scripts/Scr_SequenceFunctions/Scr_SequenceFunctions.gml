function sequenceInfo(_id, _seq) constructor {
	seqID = _id;
	seq = _seq;
}

function ChangeSequence(_key) {
	with Obj_GameManager {
		layer_sequence_pause(currSequence.seqID);
		currSequence = sequences[? _key];
		currSequence.seq.headPosition = 0;
		layer_sequence_play(currSequence.seqID);
	}
}

#region Break Time
function BreakTime_0() {
	with Obj_GameManager {
		currRound++;
		selectMicrogame = microgames[irandom(microgamesSize-1)];
		//selectMicrogame = microgames[microgamesSize-1];
		//selectMicrogame = microgames[1];
	}
}
function BreakTime_30() {
	layer_destroy_instances("Game_Instances");
	Obj_GameManager.showControls = true;
}
function BreakTime_60() {
	with Obj_GameManager { selectMicrogame.createGame(difficulty); }
}
function BreakTime_120() {
	Obj_GameManager.showControls = false;
	with Obj_CaptchaScreen { lerpToSize = maxSize; }
	with Obj_GameManager {
		gameTimer = selectMicrogame.time;
		gameWon = false;
		state = gameState;
		layer_sequence_pause(currSequence.seqID);
	}
}
#endregion

#region Game Results
function GameResults_60() {
	with Obj_GameManager {
		if gameWon
			playerScore++;
		else
			playerLives--;
	}
}
function GameResults_120() {
	with Obj_GameManager {
		//timeline_position = 0;
		// If you lost all your lives
		if (!gameWon && playerLives <= 0) {
			ResetGameSpeed();
			layer_destroy_instances("Game_Instances");
			//instance_create_layer(room_width/2-80, room_height/2, "Instances", Obj_Retry);
			//instance_create_layer(room_width/2+80, room_height/2, "Instances", Obj_GoBack);
			instance_create_layer(0, 0, "Instances", Obj_GameOverButtons);
			show_debug_message(instance_number(Obj_Retry));
			state = gameOverState;
			gameOver = true;
			//timeline_running = false;
			//timeline_index = Tl_Startup;
			ChangeSequence("Startup");
			layer_sequence_pause(currSequence.seqID);
			
		} else if (currRound % 10 == 0 && difficulty < 2) {
			ChangeSequence("LevelUp");
			state = levelUpState;
		} else if (currRound % 3 == 0) {
			ChangeSequence("SpeedUp");
			state = speedUpState;
		} else {
			ChangeSequence("Break");
			state = breakState;
		}
	}
}
#endregion

#region Speed Up
function SpeedUp_0() {
	IncrementGameSpeed();
}
function SpeedUp_180() {
	ChangeSequence("Break");
	with Obj_GameManager {
		state = breakState;
	}
}
#endregion

#region Level Up
function LevelUp_0() {
	Obj_GameManager.difficulty++;
	ResetGameSpeed()
}
function LevelUp_180() {
	ChangeSequence("Break");
	with Obj_GameManager {
		state = breakState;
	}
}
#endregion

#region Startup
function Startup_30() {
	//randomize();
}
function Startup_120() {
	ChangeSequence("Break");
}
#endregion
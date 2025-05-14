function sequenceInfo(_id, _seq) constructor {
	seqID = _id;
	seq = _seq;
}

function ChangeSequence(_key) {
	with Obj_GameManager {
		inGameState = _key == "Game";
		if inGameState {
			currentState = _key;
			return; 
		}
			
		layer_sequence_pause(currSequence.seqID);
		if ds_map_exists(sequences, _key) {
			currSequence = sequences[? _key];
			currSequence.seq.headPosition = 0;
			layer_sequence_play(currSequence.seqID);
			currentState = _key;
		} else {
			ConsoleErrorMessage("Uh oh! Someone made a sequence typo!!!");
			currentState = $"!{_key}!"
		}
	}
}

function DetermineRampUp() {
	if (currRound % 10 == 0 && difficulty < 2) {
		ChangeSequence("LevelUp");
	} else if (currRound % 3 == 0) {
		ChangeSequence("SpeedUp");
	} else {
		ChangeSequence("Break");
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
		layer_sequence_pause(currSequence.seqID);
	}
	ChangeSequence("Game");
}
#endregion

#region Game Results (Win)
function GameResultsWin_60() {
	Obj_GameManager.playerScore++;
}
function GameResultsWin_120() {
	with Obj_GameManager {
		DetermineRampUp();
	}
}
#endregion

#region Game Results (Lose)
function GameResultsLose_60() {
	Obj_GameManager.playerLives--;
}
function GameResultsLose_120() {
	with Obj_GameManager {
		// If you lost all your lives
		if playerLives <= 0 {
			ChangeSequence("GameOver");
		} else {
			DetermineRampUp();
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
		//state = breakState;
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

#region Game Over
function GameOver_0() {
	layer_destroy_instances("Game_Instances");
	ResetGameSpeed();
	gameOver = true;
}
function GameOver_120() {
	instance_create_layer(0, 0, "Instances", Obj_GameOverButtons);
}
#endregion
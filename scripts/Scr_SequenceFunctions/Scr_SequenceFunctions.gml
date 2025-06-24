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
	if !isOnBossStage {
		nextSpeedUp--;
		nextBossStage--;
	}
	
	if (nextBossStage <= 0) {
		ChangeSequence("BossStage");
	} else if (nextSpeedUp <= 0) {
		nextSpeedUp = setNextSpeedUp;
		ChangeSequence("SpeedUp");
	} else {
		ChangeSequence("Break");
	}
}

#region Break Time
function BreakTime_0() {
	Obj_GameManager.currRound++;
}
function BreakTime_30() {
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
function GameResultsWin_30() {
	layer_destroy_instances("Game_Instances");
}
function GameResultsWin_60() {
	Obj_GameManager.playerScore++;
}
function GameResultsWin_120() {
	with Obj_GameManager {
		SelectMicrogame();
		if isOnBossStage {
			if difficulty < 2 { ChangeSequence("LevelUp"); }
			else { DetermineRampUp(); }
			isOnBossStage = false;
		} else {
			DetermineRampUp();
		}
	}
}
#endregion

#region Game Results (Lose)
function GameResultsLose_30() {
	layer_destroy_instances("Game_Instances");
}
function GameResultsLose_60() {
	with Obj_GameManager {
		playerLives-=livesToTake;
	}
}
function GameResultsLose_120() {
	with Obj_GameManager {
		// If you lost all your lives
		if playerLives <= 0 {
			ChangeSequence("GameOver");
		} else {
			if !isOnBossStage
				SelectMicrogame();
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

#region Boss Stage
function BossStage_0() {
	with Obj_GameManager {
		isOnBossStage = true;
		ResetDifficultyProgression();
		SelectBossMicrogame();
		if difficulty < 2 { ResetGameSpeed(); }
	}
}
function BossStage_180() {
	ChangeSequence("Break");
}
#endregion

#region Level Up
function LevelUp_0() {
	Obj_GameManager.difficulty++;
	//ResetDifficultyProgression();
	//if difficulty < 2 { ResetGameSpeed(); }
}
function LevelUp_180() {
	ChangeSequence("Break");
}
#endregion

#region Startup
function Startup_0() {
	if !instance_exists(Obj_HighScoreManager)
		instance_create_layer(0, 0, "Instances", Obj_HighScoreManager);
	Obj_HighScoreManager.showScores = false;
}
function Startup_30() {
	//randomize();
	SelectMicrogame();
}
function Startup_120() {
	ChangeSequence("Break");
}
#endregion

#region Game Over
function GameOver_0() {
	layer_destroy_instances("Game_Instances");
	ResetGameSpeed();
	Obj_GameManager.gameOver = true;
}
function GameOver_120() {
	if !instance_exists(Obj_HighScoreManager)
		instance_create_layer(0, 0, "Instances", Obj_HighScoreManager);
		
	with Obj_HighScoreManager {
		addScoreFirebase(Obj_GameManager.playerScore, Obj_Control.playerName);
		showScores = true;
	}
	instance_create_layer(0, 0, "Instances", Obj_GameOverButtons);
}
#endregion
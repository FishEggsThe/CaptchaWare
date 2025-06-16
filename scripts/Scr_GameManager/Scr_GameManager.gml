function CheckIfCanInteract() {
	if instance_exists(Obj_GameManager) {
		with Obj_GameManager {
			if !(currentState == "Game" || currentState == "GameOver") { return false; }
		}
	}
	return true;
}

function ResetDifficultyProgression() {
	with Obj_GameManager {
		nextSpeedUp = setNextSpeedUp;
		nextBossStage = setNextBossStage;
	}
}

function ResetGame() {
	ResetDifficultyProgression()
	with Obj_GameManager {
		difficulty = 0;
		currRound = 0;
		playerScore = 0;
		playerLives = 4
		ChangeSequence("Startup");
	}
}

function GameWon() {
	with Obj_GameManager { gameWon = true; }
}

#region Game Speed
global.gameSpeed = 1;
function SetGameSpeed(_speed) {
	global.gameSpeed = _speed;
	Obj_GameManager.currSequence.seq.speedScale = _speed;
}
function GetGameSpeed() {
	return global.gameSpeed;
}
function ResetGameSpeed() {
	SetGameSpeed(1);
}
function IncrementGameSpeed(_inc = 0.05) {
	SetGameSpeed(GetGameSpeed()+_inc);
}
#endregion


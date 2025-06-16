if !CheckIfCanInteract() || Obj_GameManager.gameWon { exit; }

if input == prompt {
	GameWon();
	insertionPointTimer = setInsertionPointTimer; insertPoint = false;
}

event_inherited();
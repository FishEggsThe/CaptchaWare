if !CheckIfCanInteract() || Obj_GameManager.gameWon {
	insertionPointTimer = setInsertionPointTimer;
	insertPoint = false; exit;
}

event_inherited();
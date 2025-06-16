if !CheckIfCanInteract() { exit; }

if input == prompt {
	GameWon();
	insertionPointTimer = setInsertionPointTimer; insertPoint = false;
}

event_inherited();
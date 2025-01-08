// Making sure a key is pressed
if !keyboard_check_pressed(vk_anykey){ exit; }

var key = keyboard_key, isDigit, isLetter, shiftCheck;
// Checking if it's just a backspace
if key == vk_backspace && inputSize > 0 {
	input = string_delete(input, -1, 1);
	inputSize--; exit; 
}

// Between 0 and 9 inclusive
isDigit = key >= 48 && key <= 57;
// Between A & Z
isLetter = key >= 65 && key <= 90;
//  lower  key >= 97 && key <= 122;

// Making sure a valid key is pressed
if !(isDigit || isLetter) { exit; }

shiftCheck = 32*(!keyboard_check(vk_shift));
if isDigit
	input = string_insert(chr(key), input, inputSize+1);
else if isLetter
	input = string_insert(chr(key+shiftCheck), input, inputSize+1);
inputSize++;
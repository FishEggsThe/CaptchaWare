event_inherited();

prompt = "";
promptSize = 3+Obj_GameManager.difficulty;

var i, validSize = 10 + 26*2, validIndex = validSize - 1, validChars = [];

for(i = 0; i < 26; i++) {
	validChars[validIndex] = chr(i+65);
	validIndex--;
	validChars[validIndex] = chr(i+97);
	validIndex--;
}
for(i = 0; i < 10; i++) {
	validChars[validIndex] = chr(i+48);
	validIndex--;
}
//show_debug_message(validChars);

// Finally deciding what the prompt looks like
for(i = 1; i <= promptSize; i++) {
	prompt = string_insert(validChars[irandom(validSize-1)], prompt, i)
}
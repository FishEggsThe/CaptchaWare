// General Script to maintain code when universal changes get applied to stuff, 
// like when every sprite now needs a shadow

function DrawSprite(_sprite, _subimg, _x, _y, _xscale=1, _yscale=1, _rot=0, _col=c_white, _alpha=1){
	draw_sprite_ext(_sprite, _subimg, _x, _y, _xscale, _yscale, _rot, _col, _alpha);
}

function DrawText(_x, _y, _string, _halign, _valign, _color=c_black, _xscale=1, _yscale=1, _angle=0, _alpha=1) {
	draw_set_halign(_halign); draw_set_valign(_valign); draw_set_font(Ft_ComicSans);
	draw_text_transformed_color(_x, _y, _string, _xscale, _yscale, _angle, 
								_color, _color, _color, _color, _alpha);
}

// Standardizing game speed across any kind of movement
function MoveObjectGameSpeed(_obj, _x, _y) {
	var gameSpeed = GetGameSpeed();
	_obj.x += _x * gameSpeed;
	_obj.y += _y * gameSpeed;
}

function LerpToGameSpeed(_start, _end, _lerpValue) {
	return lerp(_start, _end, _lerpValue * GetGameSpeed());
}

// if CheckIfDuplicate() { exit; }
function CheckIfDuplicate(_instance = id) {
	if instance_number(_instance.object_index) > 1 { instance_destroy(_instance); return true; }
	return false;
}

// Below is the debug stuff
function DrawDebugText(_strings) {
	var i, margin = 5, incTextLayer = 20, layers = array_length(_strings);

	for(i = 0; i < layers; i++;)
		DrawText(margin, margin+i*incTextLayer+10, _strings[i], fa_left, fa_top);
}

// It's fun to make these error messages and never use them
function ConsoleErrorMessage(_message) {
	show_debug_message("**********************************************");
	show_debug_message("****************************************************************");
	show_debug_message("\n" + _message + "\n");
	show_debug_message("****************************************************************");
	show_debug_message("**********************************************");
}
ConsoleErrorMessage("Don't worry, this is just a test");
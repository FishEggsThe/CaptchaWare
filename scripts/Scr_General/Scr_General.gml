/* General Script to maintain code when universal changes get applied to stuff, 
	like when every sprite now needs a shadow
*/

function DrawSprite(_sprite, _subimg, _x, _y, _xscale=1, _yscale=1, _rot=0, _col=c_white, _alpha=1){
	draw_sprite_ext(_sprite, _subimg, _x, _y, _xscale, _yscale, _rot, _col, _alpha);
}

function MoveObject(_obj, _x, _y) {
	_obj.x += _x;
	_obj.y += _y;
}

// if CheckIfDuplicate() { exit; }
function CheckIfDuplicate(_instance = id) {
	if instance_number(_instance) > 1 { instance_destroy(_instance); return true; }
	return false;
}

// Below is the debug stuff
function DrawDebugText(_strings) {
	var i, margin = 5, incTextLayer = 25, layers = array_length(_strings);
	
	for(i = 0; i < layers; i++;)
		draw_text(margin, margin+i*incTextLayer+10, _strings[i]);
}
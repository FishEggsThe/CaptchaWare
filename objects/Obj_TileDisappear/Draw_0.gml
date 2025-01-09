var getSize = size;

DrawSprite(sprite, 0, x, y, getSize, getSize, 0, color);

var drawSprite = isBus ? Spr_Secret : Spr_Checkmark;
DrawSprite(drawSprite, 0, x, y, getSize, getSize, 0, c_white);
DrawText(x, y, maxRerolls, fa_center, fa_middle, c_black, 2, 2, 45, 1);
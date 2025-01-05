if size >= maxSize { exit; }

DrawSprite(sprite, 0, x, y, maxSize, maxSize, 0, backgroundColor, 2-size);
DrawSprite(sprite, 0, x, y, size, size, 0, c_white, 2-size);
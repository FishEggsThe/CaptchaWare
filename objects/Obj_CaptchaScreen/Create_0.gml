if CheckIfDuplicate() { exit; }

sprite = Spr_CaptchaScreen;
backgroundColor = #99AABB;
depth = -10;

size = 1;
lerpToSize = size
minSize = 1;
maxSize = 2;

shader = Shdr_CaptchaScreen;
uSize = shader_get_uniform(shader, "size");
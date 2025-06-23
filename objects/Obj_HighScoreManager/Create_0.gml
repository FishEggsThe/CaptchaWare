if CheckIfDuplicate() { exit; }

root = dotEnv_get("COLLECTION");
listener = FirebaseFirestore(root).Listener();
data = -1;
sort_score = function(_a, _b) {
	return _b.points - _a.points;
}

depth = -15;
numOfHighScores = 0;
highScores = [];

ifUsing = true;
scoresFetched = false;
showScores = false;
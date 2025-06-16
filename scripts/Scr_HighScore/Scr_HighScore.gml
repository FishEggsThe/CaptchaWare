function InitializeScore(p, n) {
	var s = {
		points: p,
		name: n
	};
	return s;
}

/*
Since both arrays and structs are automatically 
  collected by the garbage collector, I'm just 
  gonna comment this out unless I want to use it
*/
//function CleanUpHighScores() {
//	for(var i = 0; i < numOfHighScores; i++) {
//	    delete highScores[i];
//	}
//  highScores = [];
//}

function InitializeHighScores() {
	with Obj_HighScoreManager {
		//CleanUpHighScores();
		var p = 5, n = "Jeff";
	
		repeat(5) {
			p--;
			var hs = InitializeScore(p, n);
			array_insert(highScores, -1, hs);
		}
		numOfHighScores = array_length(highScores);
	}
}

function AddScore(p, n) {
	with Obj_HighScoreManager {
		var s = InitializeScore(p, n);
		
		for(var i = 0; i < numOfHighScores; i++) {
			if highScores[i].points < p {
				array_insert(highScores, i, s);
				break;
			}
		}
		
		numOfHighScores = array_length(highScores);
	}
}
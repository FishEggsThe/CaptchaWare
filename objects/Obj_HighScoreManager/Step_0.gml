if Obj_Debug.debug {
	if keyboard_check_released(ord("Q")) {
		var p = irandom(100), n = $"testing{p}"
		show_message($"Adding {n}");
		addScoreFirebase(p, n);
	}

	if keyboard_check_released(ord("W")) && data != -1 && array_length(data) > 0 {
		var doc = FirebaseFirestore(root).Child(data[0].id);
		doc.Delete();
		show_message("Removing");
	}
}
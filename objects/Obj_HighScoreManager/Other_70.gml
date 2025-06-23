if async_load[? "status"] == 200 {
	show_message(async_load[? "status"])
	switch (async_load[? "type"]) {
		case "FirebaseFirestore_Collection_Listener":
			FirebaseFirestore(root).Query();
			break;
		case "FirebaseFirestore_Collection_Query":
			data = [];
			
			var doc = async_load[? "value"];
			var newData = json_parse(doc);
			var names = variable_struct_get_names(newData);
			
			for (var i = 0; i < array_length(names); i++) {
				var _doc = variable_struct_get(newData, names[i]);
				_doc.id = names[i];
				array_push(data, _doc);
			}
			
			array_sort(data, sort_score);
			break;
	}
} else {
	show_message(async_load[? "status"]);
}
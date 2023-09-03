extends Node

class_name Serializer

static func save_data(storage: String, data) -> void:
	var file = FileAccess.open(storage, FileAccess.WRITE)
	file.store_var(data)
	file = null
	
static func load_data(storage: String) -> Dictionary:
	var file = FileAccess.open(storage, FileAccess.READ)
	var data = file.get_var()
	file = null
	return data

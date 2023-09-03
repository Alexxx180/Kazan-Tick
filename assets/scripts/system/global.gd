extends Node

const storage = "user://kazantick.dat"

func _ready():
	load_settings()

func save_settings():
	var file = FileAccess.open(storage, FileAccess.WRITE)
	file.store_var(settings)
	file = null
	
func load_settings():
	if not FileAccess.file_exists(storage):
		save_settings()
	
	var file = FileAccess.open(storage, FileAccess.READ)
	settings = file.get_var()
	file = null


func set_value(key: String, value: int):
	settings[key] = value
	
func get_value(key: String) -> int:
	return settings[key]

var settings = {
	"music" : 50,
	"score" : 0
}

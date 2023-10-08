extends Node

var serializer
const storage = "user://kazantick.dat"

var score: int

func _ready() -> void:
	reset()
	load_settings()
	randomize()

func get_score_string() -> String:
	return str(score)
	
func get_highscore_string() -> String:
	return str(get_value("score"))

func append_score(bonus: int) -> void:
	score += bonus

func reset() -> void:
	score = 0
	
func highscore() -> void:
	if (score > get_value("score")):
		set_value("score", score)
		save_settings()

func save_settings() -> void:
	Serializer.save_data(storage, settings)
	
func load_settings() -> void:
	if not FileAccess.file_exists(storage):
		save_settings()
	settings = Serializer.load_data(storage)


func set_coat(value: bool) -> void:
	settings["coat"] = value
	save_settings()

func set_value(key: String, value: int) -> void:
	settings[key] = value
	
func get_value(key: String) -> int:
	return settings[key]

var settings = {
	"default" : 100,
	"score" : 0,
	"coat" : false
}

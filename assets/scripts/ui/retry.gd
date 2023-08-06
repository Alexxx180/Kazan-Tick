extends Button

@export var level = ""

func _retry():
	get_tree().reload_scene(level)

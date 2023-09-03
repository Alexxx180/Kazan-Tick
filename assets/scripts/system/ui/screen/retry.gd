extends Button

signal reset_score()

@export var level = ""

func _ready():
	pass

func _retry():
	var reload = get_tree().change_scene_to_file(level)
	if reload != OK:
		print("Error during reloading '%s'" % level)
	Global.reset()
	emit_signal("reset_score")

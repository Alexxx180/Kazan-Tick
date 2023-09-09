extends "res://assets/scripts/system/ui/screen/play.gd"

signal reset_score()

@export var level = "res://assets/scenes/system/levels/kazan.tscn"

func _retry():
	var reload = get_tree().change_scene_to_file(level)
	if reload != OK:
		printerr("Error during reloading '%s'" % level)
	Global.reset()
	emit_signal("reset_score")
	go()

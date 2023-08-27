extends Button

@export var level = ""

func _retry():
	var reload = get_tree().change_scene_to_file(level)
	if reload != OK:
		print("Error during reloading '%s'" % level)

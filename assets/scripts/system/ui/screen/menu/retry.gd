extends Button

@export var level = "res://assets/scenes/kazan.tscn"

func _retry():
	var tree = get_tree()
	var reload = tree.change_scene_to_file(level)
	if reload != OK:
		printerr("Error during reloading '%s'" % level)
	Global.reset()

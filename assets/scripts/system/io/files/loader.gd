extends Node

## Path to directory holding the block scenes
@export_dir var files = "res://assets/scenes"

func _ready() -> void:
	_load_scenes(files)

func _scene_check(scene: String):
	if (scene.contains(".tscn.")):
		return scene.get_basename()
	else:
		return scene


func _load_scenes(target: String) -> void:
	
	print("Located: %s" % target)
	var message = "Loaded '{scene}': {path}"
	
	var parent = get_parent()
	var blocks = DirAccess.open(target)
	
	for scene in blocks.get_files():
		
		var file = _scene_check(scene)
		var path = target + "/" + file
		var block = load(path)
		
		parent.add_element(name, block)
		print(message.format({
			"scene": name, "path" : path
		}))

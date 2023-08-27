extends Node

## Path to directory holding the block scenes
@export_dir var files = "res://assets/scenes"

func _ready() -> void:
	_load_scenes(files)

func _load_scenes(target: String) -> void:
	
	var parent = get_parent()
	var blocks = DirAccess.open(target)
	var message = "Loaded '{scene}': {path}"
	
	for scene in blocks.get_files():
		
		var path = target + "/" + scene
		var block = load(path)
		
		parent.add_element(name, block)
		print(message.format({"scene": name, "path" : path}))

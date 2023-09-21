extends "res://addons/godot-behavior-tree-plugin/sequence.gd"

@export var obstacle: Vector2i = Vector2i(0, 1)

func _ready():
	$act.check = int(str(name))
	var obstacles = $obstacles
	obstacles.offset = obstacle.x
	obstacles.max_count = obstacle.y

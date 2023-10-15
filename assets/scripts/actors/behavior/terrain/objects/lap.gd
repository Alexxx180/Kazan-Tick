extends "res://addons/godot-behavior-tree-plugin/sequence.gd"

@export_range(0, 2) var count: int = 1

func _ready():
	$act.check = int(str(name))
	$obstacles/determinant.limit = count

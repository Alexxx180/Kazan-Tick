extends "res://addons/godot-behavior-tree-plugin/sequence.gd"

@export var obstacle: Vector2i = Vector2i(0, 1)

func _ready():
	$act.check = int(str(name))
	$obstacles/anchoring.offset = obstacle.x
	$obstacles/determinant.limit = obstacle.y

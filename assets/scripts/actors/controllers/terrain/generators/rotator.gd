extends "res://assets/scripts/actors/controllers/terrain/generators/constant.gd"

@export var angles: Vector2i = Vector2i(23, 15)

func generate():
	var block = super.generate()
	block.get_node("merger").rotation.y = randi_range(0, angles.x) * angles.y
	return block

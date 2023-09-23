extends Node3D

"""
Terrain conveyor
---
Progresses a set of chosen blocks one after another
"""

# Offset: terrain start, blocks interval, conveyor
@export var offset: Vector3 = Vector3(0, 1, 0)

@onready var generator = $generator
@export var mesh_path = "mesh"
var rendering: Array[Node3D] = []

func add_block(block):
	add_child(block)
	rendering.append(block)

func append_block(block, current):
	block.append_to_edge(current, offset.y)
	add_block(block)

func fill_space(count: int) -> void:
	for index in count:
		var block = generator.generate()
		
		if index == 0:
			var edge = block.get_center() + offset.x + offset.z
			block.position.z = edge
			add_block(block)
		else:
			var current = rendering[index - 1]
			append_block(block, current)
		
func check_out_of_bounds() -> void:
	var first = rendering[0]
	var edge = first.get_center() + offset.z
	
	if first.position.z > edge:
		var last = rendering[-1]
		
		first = rendering.pop_front()
		first.queue_free()
		
		var block = generator.generate()
		append_block(block, last)
		

func progress_terrain(speed) -> void:
	check_out_of_bounds()
	for block in rendering:
		block.position.z += speed
	

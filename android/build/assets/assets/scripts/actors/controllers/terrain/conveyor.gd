extends Node3D

## When a given block passes behind this node is removed
## and a new block is added to the far end of the conveyor

## The set of terrain blocks which are currently rendered to viewport
var space: Array[Node3D] = []

# Offset: terrain start, blocks interval, conveyor
@export var offset: Vector3 = Vector3(0, 1, 0)

@onready var generator = $generator
@export var mesh_path = "mesh"

func fill_space(count: int) -> void:
	for index in count:
		var block = generator.generate()
		
		if index == 0:
			var edge = block.get_center() + offset.x + offset.z
			block.position.z = edge
		else:
			var current = space[index - 1]
			block.append_to_edge(current, offset.y)
		
		add_child(block)
		space.append(block)
		
func check_out_of_bounds() -> void:
	var edge = space[0].get_center() + offset.z
	if space[0].position.z > edge:
		var last = space[-1]
		var first = space.pop_front()
		first.queue_free()
		
		var block = generator.generate()
		
		block.append_to_edge(last, offset.y)
		add_child(block)
		space.append(block)

func progress_terrain(velocity: float, delta: float) -> void:
	check_out_of_bounds()
	for block in space:
		block.position.z += velocity * delta
	

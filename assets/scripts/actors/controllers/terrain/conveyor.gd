extends Node3D

## When a given block passes behind this node is removed
## and a new block is added to the far end of the conveyor

## The set of terrain blocks which are currently rendered to viewport
var space: Array[Node3D] = []

@export var offset: int = 0

@onready var generator = $generator
@export var interval: int = 1: set = set_interval, get = get_interval
@export var mesh_path = "mesh"

func set_interval(x: int):
	interval = x
	
func get_interval() -> int:
	return interval


func fill_space(count: int) -> void:
	for index in count:
		var block = generator.generate()
		
		if index == 0:
			block.position.z = block.get_center()
		else:
			var current = space[index - 1]
			block.append_to_edge(current, interval)
		
		add_child(block)
		space.append(block)
		
func check_out_of_bounds() -> void:
	if space[0].position.z > space[0].get_center() + offset:
		var last = space[-1]
		var first = space.pop_front()
		first.queue_free()
		
		var block = generator.generate()
		
		block.append_to_edge(last, interval)
		add_child(block)
		space.append(block)

func progress_terrain(velocity: float, delta: float) -> void:
	check_out_of_bounds()
	for block in space:
		block.position.z += velocity * delta
	

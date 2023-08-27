extends Node3D

## This builds and operates the terrain "conveyor belt"
##
## A set of randomly choosen terrain blocks is rendered to the viewport.
## As the game played the terrain is moved in the positive Z direction.
## When a given block passes behind this node it is removed and a new 
## block is added to the far end of the conveyor

## The set of terrain blocks which are currently rendered to viewport
var space: Array[Node3D] = []
@onready var generator = $generator

@export var interval: int = 1: set = set_interval, get = get_interval

func set_interval(x: int):
	interval = x
	
func get_interval() -> int:
	return interval

func _get_mesh_center(block: Node3D):
	var instance = block.get_node("mesh")
	return instance.mesh.size.y / 2
	
func _append_to_far_edge(targeted: Node3D, appendix: Node3D) -> void:
	var target = _get_mesh_center(targeted)
	var append = _get_mesh_center(appendix)
	appendix.position.z = targeted.position.z - target - append - interval


func fill_space(count: int) -> void:
	for index in count:
		var block = generator.generate()
		
		if index == 0:
			block.position.z = _get_mesh_center(block)
		else:
			_append_to_far_edge(space[index - 1], block)
		
		add_child(block)
		space.append(block)
		
func check_out_of_bounds() -> void:
	if space[0].position.z >= _get_mesh_center(space[0]):
		var last = space[-1]
		var first = space.pop_front()
		var block = generator.generate()
		
		_append_to_far_edge(last, block)
		add_child(block)
		space.append(block)
		first.queue_free()

func progress_terrain(velocity: float, delta: float) -> void:
	for block in space:
		block.position.z += velocity * delta
	

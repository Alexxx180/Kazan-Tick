extends Node3D

# Storage controls rendering scene nodes
var rendering: Array[Node3D] = []

func get_current(index: int):
	return rendering[index - 1]

func get_first():
	return rendering[0]
	
func get_last():
	return rendering[-1]

func add_block(block):
	add_child(block)
	rendering.append(block)

func append_block(block, current, offset: float):
	block.append_to_edge(current, offset)
	add_block(block)
	
func drop_front():
	var first = rendering.pop_front()
	remove_child(first)
	first.queue_free()

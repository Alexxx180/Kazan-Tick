extends Node

# Progress blocks with defined interval
@export var interval: float = 0
@export var offset: float = 0

var storage
var generator

func check_out_of_bounds() -> void:
	var first = storage.get_first()
	var edge = first.get_center() + offset
	
	if first.position.z > edge:
		var last = storage.get_last()
		var block = generator.generate()
		storage.drop_front()
		storage.append_block(block, last, interval)


func progress(speed) -> void:
	check_out_of_bounds()
	for block in storage.rendering:
		block.position.z += speed

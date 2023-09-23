extends Node

"""
Fills the worldspace with provided storage,
generator, offset and objects max count
"""

func fill_space(storage, generator, offset: Vector3i, count: int) -> void:
	for index in count:
		var block = generator.generate()
		
		if index == 0:
			var edge = block.get_center() + offset.x + offset.z
			block.position.z = edge
			storage.add_block(block)
		else:
			var current = storage.get_current(index)
			storage.append_block(block, current)

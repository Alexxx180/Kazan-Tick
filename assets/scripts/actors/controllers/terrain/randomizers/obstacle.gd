extends "res://addons/godot-behavior-tree-plugin/action.gd"

@export var obstacles_count: int = 0

func tick(tact: Tick) -> int:
	# Receiving all blocks and free space amount
	var blocks = tact.blackboard.get_value("blocks")
	var amount = tact.blackboard.get_value("space")
	
	# Setup obstacles and markers with result node
	var obstacles = blocks["obstacles"]
	var result = tact.blackboard.get_value("result")
	var markers = result.get_markers()
	
	# Determine obstacles max count and free space
	var count = randi_range(1, obstacles_count)
	var anchor = randi_range(0, amount.size() - 1)
	anchor = abs(anchor - 1) # create obstacles offset
	var space = range(0, markers.size())
	space.remove_at(anchor)
	
	while space.size() > 0 and count > 0:
		# Determine and instantiate object
		var type = randi_range(0, obstacles.size() - 1)
		var obstacle = obstacles[type].instantiate()
		
		obstacle.change_look()
		
		# Set object on available position
		var current = randi_range(0, space.size() - 1)
		var available = space[current]
		obstacle.position = markers[available].position
		
		# Add obstacle and remove free space
		result.obstacles.add_child(obstacle)
		space.remove_at(current)
		count -= 1
	
	# Return free space anchor
	space.append(anchor)
	tact.blackboard.set_value("space", space)
	
	return super.tick(tact)


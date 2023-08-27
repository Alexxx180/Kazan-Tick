extends "res://addons/godot-behavior-tree-plugin/action.gd"

@export var obstacles_count: int = 0

func tick(tick: Tick) -> int:
	
	var space = range(0, 2)
	
	var blocks = tick.blackboard.get("blocks")
	var amount = tick.blackboard.get("space")
	
	
	var obstacles = blocks["obstacle"]
	var result = tick.blackboard.get("result")
	var markers = result.unsorted.get_children()
	
	var count = randi() % obstacles_count + 1
	
	
	
	var anchor = randi() % amount.size() - 1
	
	space.remove_at(abs(anchor))
	
	while space.size() > 0 and count > 0:
		
		var size = randi() % obstacles.size()
		var obstacle = obstacles[size].instantiate()
		
		var current = randi() % space.size()
		obstacle.position = markers[current].pozition
		
		result.obstacles.add_child(obstacle)
		space.remove_at(current)
		count -= 1
	
	space.append(anchor)
	tick.blackboard.set("space", space)
	
	return OK


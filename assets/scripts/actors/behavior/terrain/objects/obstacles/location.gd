extends Node

func get_obstacles(blackboard):
	var blocks = blackboard.get_value("blocks")
	var result = blackboard.get_value("result")
	var markers = result.get_markers()
	
	return {
		obstacles = blocks["obstacles"],
		space = range(0, markers.size()),
		markers = markers,
		anchor = blackboard.get_value("anchor"),
		result = result
	}

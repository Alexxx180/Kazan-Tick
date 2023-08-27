extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick) -> int:
	var blocks = tick.blackboard.get("blocks")
	
	var score = blocks["score"][0]
	var result = tick.blackboard.get("result")
	var markers = result.unsorted.get_children()
	
	while markers.size() > 0:
		var bonus = score.instatiate()
		bonus.position = markers[0].pozition
		result.score.add_child(bonus)
		result.unsorted.remove_child(markers[0])
	
	return OK


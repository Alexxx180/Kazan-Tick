extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tact: Tick) -> int:
	var blocks = tact.blackboard.get_value("blocks")
	
	var score = blocks["score"][0]
	var result = tact.blackboard.get_value("result")
	var markers = result.get_markers()
	
	for marker in markers:
		var bonus = score.instantiate()
		bonus.position = marker.position
		result.add_score(bonus)
	
	return super.tick(tact)


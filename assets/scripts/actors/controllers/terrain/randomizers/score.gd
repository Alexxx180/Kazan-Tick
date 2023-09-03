extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tact: Tick) -> int:
	var blocks = tact.blackboard.get_value("blocks")
	
	var score = blocks["score"][0]
	var result = tact.blackboard.get_value("result")
	var markers = result.get_markers()
	
	while markers.size() > 0:
		var bonus = score.instantiate()
		bonus.position = markers[0].position
		result.add_score(bonus)
		markers.remove_at(0)
	
	return super.tick(tact)


extends Node3D

var score: get = get_score
var obstacles: get = get_obstacles
var unsorted: get = get_unsorted

func get_unsorted():
	if (unsorted == null):
		unsorted = $unsorted
	return unsorted
	
func get_obstacles():
	if (obstacles == null):
		obstacles = $obstacles
	return obstacles

func get_score():
	if (score == null):
		score = $score
	return score


func get_markers():
	return unsorted.get_children()

func free_marker(marker):
	unsorted.remove_child(marker)

func add_score(instance):
	score.add_child(instance)

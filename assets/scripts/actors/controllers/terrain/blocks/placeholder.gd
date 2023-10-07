extends Node3D

@export var mesh_center = 1

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
	
func free_markers():
	unsorted.queue_free()

func add_score(instance):
	score.add_child(instance)


func get_center():
	return mesh_center
	
func append_to_edge(target: Node3D, interval: int) -> void:
	var z = target.position.z
	var center = target.get_center()
	var append = get_center()
	position.z = z - center - append - interval

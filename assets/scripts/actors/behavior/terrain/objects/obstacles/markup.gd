extends Node

# Get current obstacle
func _determine_object(obstacles):
	var type = randi_range(0, obstacles.size() - 1)
	return obstacles[type].instantiate()

# Get available position
func _target_available(markers, space):
	var current = randi_range(0, space.size() - 1)
	var available = space[current]
	space.remove_at(current)
	return markers[available].position


func retrieve_from(location):
	var markers = location.markers
	var obstacle = _determine_object(location.obstacles)
	obstacle.position = _target_available(markers, location.space)
	obstacle.change_look()
	return obstacle

extends "res://addons/godot-behavior-tree-plugin/action.gd"

@export_range(0, 2) var limit: int = 1

@onready var markup = $markup
@onready var place = $location

func generate_obstacles(location):
	var space = location.space
	
	space.remove_at(location.anchor)
	
	for step in mini(space.size(), limit):
		var obstacle = markup.retrieve_from(location)
		location.result.obstacles.add_child(obstacle)
	
	space.append(location.anchor)
	
	return location.space

func tick(tact: Tick) -> int:
	var blackboard = tact.blackboard
	var obstacles = place.get_obstacles(blackboard)
	var space = generate_obstacles(obstacles)
	blackboard.set_value("space", space)
	return super.tick(tact)

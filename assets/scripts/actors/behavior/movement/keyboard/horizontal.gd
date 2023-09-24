extends "res://addons/godot-behavior-tree-plugin/action.gd"

func move(tact: Tick, direction: int):
	tact.actor.change_direction(direction)
	return OK


func tick(tact: Tick):
	if (Input.is_action_just_pressed("left")):
		return move(tact, -1)
	
	if (Input.is_action_just_pressed("right")):
		return move(tact, 1)
		
	return FAILED

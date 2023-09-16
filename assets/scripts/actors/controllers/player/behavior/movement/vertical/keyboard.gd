extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tact: Tick):
	if (Input.is_action_pressed("up") or Input.is_action_pressed("jump")):
		tact.blackboard.set_value('swipe', 'up')
		return OK
	return FAILED

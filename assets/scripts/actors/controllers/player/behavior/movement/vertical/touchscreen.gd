extends "res://addons/godot-behavior-tree-plugin/action.gd"

@export var speed: int = -10

func swipe(relative: float, data):
	if (relative < speed):
		data.set_value('swipe', 'up')
		return OK
	return FAILED


func touch(e, tact):
	return swipe(e.relative.y, tact.actor)
	
func mouse(e, data):
	var state = FAILED
	if data.get_value('drag'):
		state = swipe(e.relative.y, data)
	if state == OK:
		data.set_value('drag', false)
	return state


func tick(tact: Tick):
	var data = tact.blackboard
	var e = data.get_value('event')
	
	if e is InputEventScreenDrag:
		return touch(e, data)
	
	if e is InputEventMouseMotion:
		return mouse(e, data)
	
	return FAILED

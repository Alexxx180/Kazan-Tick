extends "res://addons/godot-behavior-tree-plugin/action.gd"

@export var speed: int = 5

func swipe(axis: float, actor):
	if axis > speed:
		actor.change_direction(1)
		return OK
	elif axis < -speed:
		actor.change_direction(-1)
		return OK
	return FAILED


func touch(e, tact):
	return swipe(e.relative.x, tact.actor)
	
func mouse(e, tact):
	var state = FAILED
	var data = tact.blackboard
	if data.get_value('drag'):
		state = swipe(e.relative.x, tact.actor)
	if state == OK:
		data.set_value('drag', false)
	return state


func tick(tact: Tick):
	var e = tact.blackboard.get_value('event')
	
	if e is InputEventScreenDrag:
		return touch(e, tact)
	
	if e is InputEventMouseMotion:
		return mouse(e, tact)
		
	return FAILED

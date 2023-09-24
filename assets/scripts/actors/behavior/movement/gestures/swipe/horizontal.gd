extends Node

@export var speed: int = 5

func swipe(axis: float, actor):
	if axis > speed:
		actor.change_direction(1)
		return OK
	elif axis < -speed:
		actor.change_direction(-1)
		return OK
	return FAILED

extends Node

@export var speed: int = -10

func swipe(relative: float, data):
	if (relative < speed):
		data.set_value('swipe', 'up')
		return OK
	return FAILED

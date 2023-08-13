extends "res://addons/godot-behavior-tree-plugin/decorator.gd"

@export var wait_time: float = 1.0

var _tick_time:float = 0.0

func enter(_tick: Tick) -> void:
	_tick_time = wait_time

func _process(delta:float):
	_tick_time -= delta

func is_waiting() -> bool:
	return _tick_time > 0.0

func reset_wait():
	_tick_time = wait_time

func tick(tick: Tick) -> int:
	
	var result = ERR_BUSY
	if not is_waiting():
		# 0..1 children
		for child in get_children():
			result = child.tick(tick)
			reset_wait()
			return result

	# Timer still ticking
	return result

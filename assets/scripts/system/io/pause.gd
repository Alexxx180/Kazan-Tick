extends Node

@export var initial: bool = false

func _ready():
	if (initial):
		get_tree().paused = true

func _pause_process():
	var tree = get_tree()
	tree.paused = !tree.paused

extends Node3D

"""
Terrain generator
---
Hold the blocks catalog and render them to the viewport
"""

@export_file("*.tscn") var placeholder_file: String

var behavior
var blackboard: Variant = null

func _ready():
	behavior = $behavior

func _set_blackboard():
	blackboard = $blackboard
	blackboard.set_value("placeholder", load(placeholder_file))
	blackboard.set_value("blocks", { "obstacles" : [], "score" : [] })
	blackboard.set_value("space", [0, 1, 2])
	blackboard.set_value("lap", -1)

func get_blackboard():
	if (blackboard == null):
		_set_blackboard()
	return blackboard

func add_element(type: String, block):
	var blocks = get_blackboard().get_value("blocks")
	blocks[type].append(block)

func generate():
	behavior.tick(self, get_blackboard(), true)
	return blackboard.get_value("result")

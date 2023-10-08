extends Node3D

"""
Terrain generator
---
Holds and renders the blocks catalog to the viewport
"""

@export_file("*.tscn") var placeholder_file: String

var behavior
var blackboard: Variant = null

func _ready():
	behavior = $behavior

func _set_blackboard(blocks):
	blackboard = $blackboard
	var space = [0, 1, 2]
	blackboard.set_value("placeholder", load(placeholder_file))
	blackboard.set_value("blocks", blocks)
	blackboard.set_value("space", space)
	blackboard.set_value("amount", space.size() - 1)
	
	blackboard.set_value("anchor", 1)
	blackboard.set_value("angle", 0.0)
	blackboard.set_value("lap", -1)

func get_blackboard():
	if (blackboard == null):
		_set_blackboard({ "obstacles" : [], "score" : [] })
	return blackboard

func add_element(type: String, block):
	var blocks = get_blackboard().get_value("blocks")
	blocks[type].append(block)

func generate():
	behavior.tick(self, get_blackboard(), true)
	return blackboard.get_value("result")

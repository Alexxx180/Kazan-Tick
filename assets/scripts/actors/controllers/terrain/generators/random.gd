extends Node3D

## This is the terrain generator
## A set of randomly choosen terrain blocks is rendered to the viewport.
## Holds the catalog of loaded terrain block scenes

@export_file("*.tscn") var placeholder_file: String

var behavior
var blackboard: Variant

func get_blackboard():
	if (blackboard != null):
		return blackboard
	blackboard = $blackboard
	blackboard.set_value("placeholder", load(placeholder_file))
	blackboard.set_value("blocks", { "obstacles" : [], "score" : [] })
	blackboard.set_value("space", [0, 1, 2])
	blackboard.set_value("lap", -1)
	return blackboard

func add_element(type: String, block):
	var blocks = get_blackboard().get_value("blocks")
	blocks[type].append(block)

func _ready():
	behavior = $behavior

func generate():
	behavior.tick(self, get_blackboard(), true)
	return blackboard.get_value("result")

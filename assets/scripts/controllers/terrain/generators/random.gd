extends Node3D

## This is the terrain generator
## A set of randomly choosen terrain blocks is rendered to the viewport.
## Holds the catalog of loaded terrain block scenes

@export_file("*.tscn") var placeholder_file: String

@onready var behavior = $behavior
@onready var blackboard = $blackboard

func add_element(name: String, block):
	var blocks = blackboard.get("blocks")
	blocks[name].append(block)
	print("Received block type: " + name)

func _ready():
	blackboard.set("placeholder", load(placeholder_file))
	blackboard.set("blocks", { "obstacles" : [], "score" : [] })

func generate():
	behavior.tick(self, blackboard)
	return blackboard.get("result")

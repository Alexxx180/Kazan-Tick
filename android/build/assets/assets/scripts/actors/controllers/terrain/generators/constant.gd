extends Node3D

## This is the terrain generator
## A set of randomly choosen terrain blocks is rendered to the viewport.
## Holds the catalog of loaded terrain block scenes
var blocks: Array = []

func add_element(type: String, block):
	blocks.append(block)
	print("Received block type: " + type)

func generate():
	return blocks.pick_random().instantiate()

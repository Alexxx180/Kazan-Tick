extends Node3D

"""
Terrain generator
---
Hold the blocks catalog and render them to the viewport
"""

var blocks: Array = []

func add_element(type: String, block):
	blocks.append(block)
	print("Received block type: " + type)

func generate():
	return blocks.pick_random().instantiate()

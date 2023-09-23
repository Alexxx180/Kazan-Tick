extends Node3D

"""
Terrain conveyor
---
Progresses a set of chosen blocks one after another
"""

# Offset: on start, interval, conveyor
@export var offset: Vector3 = Vector3(0, 1, 0)
@onready var progressor = $progressor

func _ready():
	progressor.storage = $storage
	progressor.generator = $generator

func fill_space(count: int) -> void:
	var storage = progressor.storage
	var generator = progressor.generator
	$filler.fill_space(storage, generator, offset, count)
		
func progress_terrain(speed) -> void:
	progressor.progress(speed)

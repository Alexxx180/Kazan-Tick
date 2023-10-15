extends Node3D

# Rendering far for: sides, decorations, road
@export var far: Vector3i = Vector3i(6, 2, 4)

@onready var sides = $sides
@onready var lanterns = $lanterns
@onready var road = $road

func fill_space() -> void:
	sides.fill_space(far.x)
	lanterns.fill_space(far.y)
	road.fill_space(far.z)

func progress(speed: float) -> void:
	sides.progress(speed)
	lanterns.progress(speed)
	road.progress(speed)
	

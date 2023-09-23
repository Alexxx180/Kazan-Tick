extends Node3D

# Rendering far for: sides, track decorations, road
@export var decorations_far: Vector3i = Vector3i(6, 2, 4)

@onready var road = $road
@onready var lanterns = $decorations/lanterns
@onready var sides = $decorations/sides

func fill_space() -> void:
	sides.fill_space(decorations_far.x)
	lanterns.fill_space(decorations_far.y)
	road.fill_space(decorations_far.z)

func progress_terrain(speed: float) -> void:
	sides.progress_terrain(speed)
	lanterns.progress_terrain(speed)
	road.progress_terrain(speed)
	

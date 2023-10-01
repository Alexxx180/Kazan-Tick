extends Node

const jump: float = 6
const weight: float = 2

const gravity3d = "physics/3d/default_gravity"

var gravity = ProjectSettings.get_setting(gravity3d)

@export var tracks: String
@onready var markers = get_node(tracks).get_children()

var current: int = 1

func new_direction(turn):
	current = clamp(current + turn, 0, 2)
	return markers[current].position.x

func gravity_force(delta):
	return gravity * weight * delta

extends Node3D

# Render speed and keeping count
@export var obstacles_far: int = 6
@export var velocity: float = 15.0

@onready var terrain = $terrain
@onready var objects = $objects

func _physics_process(delta: float) -> void:
	var speed = velocity * delta
	_progress(speed)

func _ready() -> void:
	terrain.fill_space()
	objects.fill_space(obstacles_far)

func _progress(speed: float) -> void:
	terrain.progress(speed)
	objects.progress(speed)

extends Node

var hero: CharacterBody3D
var doll: Node3D

@onready var processor = $processor

func change_direction(turn):
	hero.position.x = processor.new_direction(turn)


func air(state):
	hero.velocity.y = state
	hero.move_and_slide()
	
func jump():
	if (doll.is_jumping()):
		doll.jump()
		air(processor.jump)

func hover(delta):
	var force = processor.gravity_force(delta)
	
	air(hero.velocity.y - force)
	if hero.is_on_floor():
		doll.set_floor(true)


func _physics_process(delta):
	if (!doll.is_running()):
		return

	if hero.is_on_floor():
		jump()
	else:
		hover(delta)

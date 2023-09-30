extends CharacterBody3D

signal hit

@onready var doll = $doll
@onready var vision = $vision
@onready var logic = $physics

func _ready():
	doll.hero = self
	logic.hero = self
	logic.doll = doll
	logic.change_direction(0)
	
func switch_pause():
	vision.pause()
	doll.pause()
	
func collide():
	Global.highscore()
	vision.game_over()
	hit.emit()

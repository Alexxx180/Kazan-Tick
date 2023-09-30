extends Control

@onready var current: Label = $current
@export var retry: String

func _ready():
	set_score()

func set_score():
	current.text = Global.get_score_string()

func append(bonus: int):
	Global.append_score(bonus)
	set_score()

extends Control

var current: Label

func _ready():
	current = $current
	_set_score(Global.get_value("score"))
	
func _set_score(score: int):
	current.text = str(score)
	
func append_score(bonus: int):
	var previous = Global.get_value("score")
	var next = previous + bonus
	Global.set_value("score", next)
	_set_score(next)

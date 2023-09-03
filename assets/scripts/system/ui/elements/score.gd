extends Control

var current: Label

func _ready():
	current = $current
	current.text = Global.get_score_string()
	
func append_score(bonus: int):
	Global.append_score(bonus)
	current.text = Global.get_score_string()

extends Control

var current: Label

func set_score():
	current.text = Global.get_score_string()

func _ready():
	current = $current
	set_score()
	var parent = get_parent()
	parent.get_node("retry/option").reset_score.connect(set_score)
	
func append_score(bonus: int):
	Global.append_score(bonus)
	set_score()

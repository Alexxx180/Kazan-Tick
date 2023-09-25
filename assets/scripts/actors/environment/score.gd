extends Area3D

@export var score: int = 1

func _on_receive(hero: CharacterBody3D):
	hero.emit_signal("score_received", score)
	get_parent().queue_free()

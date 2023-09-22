extends Area3D

@export var score: int = 1

func _on_receive(hero: CharacterBody3D):
	set_deferred("monitoring", false)
	hero.emit_signal("score_received", score)

	var parent = get_parent()
	for child in parent.get_children():
		child.set_deferred("monitoring", false)

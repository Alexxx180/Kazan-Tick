extends Area3D

@export var bonus: int = 1

func _on_receive(hero: CharacterBody3D):
	hero.vision.score.append(bonus)
	get_parent().queue_free()

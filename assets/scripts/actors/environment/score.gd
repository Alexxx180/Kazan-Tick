extends Area3D

@export var score: int = 1

func _on_receive(hero: CharacterBody3D):
	print("Score +%s" % score)
	hero.emit_signal("score_received", score)
	#self.parent.queue_free()

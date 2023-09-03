extends Area3D

@export var score: int = 1

func _on_receive(hero: CharacterBody3D):
	set_deferred("monitoring", false)
	print("Score +%s" % score)
	hero.emit_signal("score_received", score)
	
	var parent = get_parent()
	#if (parent == null):
		#queue_free()
		#return
		
	
	
	for child in parent.get_children():
		child.set_deferred("monitoring", false)
		print(child.monitoring)
		
	"""
	var children = parent.get_children()
	while children.size() > 0:
		parent.call_deferred("remove_child", children[0])
		#parent.remove_child(children[0])
		#children[0].queue_free()
		print("removed child")
		children.remove_at(0)
	"""

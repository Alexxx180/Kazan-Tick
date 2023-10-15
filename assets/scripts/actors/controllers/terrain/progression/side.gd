extends Node3D

@onready var left = $left
@onready var right = $right

func fill_space(far: int):
	left.fill_space(far)
	right.fill_space(far)

func progress(delta):
	left.progress(delta)
	right.progress(delta)

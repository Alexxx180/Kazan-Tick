extends Node3D

@onready var animation = $AnimationPlayer

var animation_name: String = "Armature|Armature|Armature|Armature|mixamo_com|Layer0"

func play():
	animation.play(animation_name)

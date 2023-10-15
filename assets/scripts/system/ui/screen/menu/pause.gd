extends "res://assets/scripts/system/ui/screen/menu/play.gd"

func _ready():
	super._ready()
	grab_focus()

func _continue():
	go()
	self.text = "Continue"

extends Node

var game

func touch(e, tact):
	return game.swipe(e.relative.x, tact.actor)

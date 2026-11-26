extends Node

var levels: Array[PackedScene] = [
	preload("res://scenes/level_1.tscn"),
	preload("res://scenes/level_2.tscn"),
	preload("res://scenes/level_3.tscn")
]

var current_level: int = 0

func get_current_level() -> PackedScene:
	return levels[current_level]

func get_next_level() -> PackedScene:
	current_level += 1
	
	if current_level >= levels.size():
		return null
	
	return levels[current_level]

func reset_game() -> void:
	current_level = 0

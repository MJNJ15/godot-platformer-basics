extends CanvasLayer

signal restart_level
signal next_level

@onready var restart_button: TextureButton = $Control/Restart_Button
@onready var next_button: TextureButton = $Control/Next_Button

func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	restart_level.emit()
	get_tree().reload_current_scene()

func _on_next_button_pressed() -> void:
	get_tree().paused = false
	
	var next_level = LevelManager.get_next_level()
	
	if next_level != null:
		get_tree().change_scene_to_packed(next_level)
	else:
		LevelManager.reset_game()
		get_tree().change_scene_to_file("res://scenes/level_1.tscn")

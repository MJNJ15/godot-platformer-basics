extends Node2D

@onready var finish: Area2D = $Finish
@onready var finish_popup: CanvasLayer = $Finish_popup

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	finish.level_finished.connect(_on_level_finished)

func _on_level_finished() -> void:
	finish_popup.visible = true
	get_tree().paused = true

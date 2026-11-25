extends Node2D

@onready var finish: Area2D = $Finish
@onready var finish_popup: CanvasLayer = $Finish_popup
@onready var apple_score_label: Label = $Apple_Score_Label
@onready var apples: Array[Area2D]

var apple_score: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apple_score = 0;
	apples.assign($Apples.get_children())
	
	finish.level_finished.connect(_on_level_finished)
	for apple in apples:
		apple.get_apple.connect(_on_get_apple)

func _on_level_finished() -> void:
	finish_popup.visible = true
	get_tree().paused = true

func _on_get_apple() -> void:
	apple_score = apple_score + 1
	apple_score_label.update_apple_score(apple_score)

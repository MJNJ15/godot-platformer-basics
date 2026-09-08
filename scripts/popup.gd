extends CanvasLayer

@onready var level_manager: Node2D = $".."


@onready var home_button: TextureButton = $Control/home_button
@onready var resrtart_button: TextureButton = $Control/resrtart_button
@onready var close_button: TextureButton = $Control/close_button

@onready var game_over: Sprite2D = $Control/game_over
@onready var victory: Sprite2D = $Control/victory

@onready var texts: Array[Sprite2D] = [
	$Control/game_over,
	$Control/victory,
	$Control/paused
] 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("back"):
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused
	pass

func _on_resrtart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_home_button_pressed() -> void:
	pass # Replace with function body.

func _on_close_button_pressed() -> void:
	visible = false
	get_tree().paused = false

func on_player_died():
	visible = true
	texts[0].visible = true
	close_button.disabled = true

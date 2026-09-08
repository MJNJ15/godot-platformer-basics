extends Node2D

@onready var player: CharacterBody2D = $player
@onready var popup: CanvasLayer = $popup
@onready var hud: CanvasLayer = $HUD

var gem : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.player_died.connect(on_player_died)
	gem = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_player_died():
	popup.on_player_died()

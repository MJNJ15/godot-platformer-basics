extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

signal get_apple

func _ready() -> void:
	animated_sprite_2d.play("idle")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		queue_free()
		get_apple.emit()

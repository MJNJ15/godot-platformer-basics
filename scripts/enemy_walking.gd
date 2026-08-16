extends Area2D
@onready var enemy_walking_sprite: AnimatedSprite2D = $enemy_walking_sprite

@export var direction = 1
@export var patrol = 1.5

var speed = 2
var timer = 0

func _physics_process(delta: float) -> void:
	enemy_walking_sprite.play("walk")
	
	timer += delta
	
	if timer >= patrol:
		timer = 0
		direction *= -1
	
	position.x += speed * direction
	enemy_walking_sprite.flip_h = direction < 0

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player": 
		get_tree().reload_current_scene()

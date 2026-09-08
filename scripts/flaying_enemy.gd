extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


@export var speed = 2.0
@export var patrol_time = 2
@export var direction = 1

var timer = 0

var die = false

func _physics_process(delta: float) -> void:
	
	timer += delta
	
	if timer >= patrol_time:
		timer = 0
		direction *= -1
	
	position.y += speed * direction
	animated_sprite_2d.flip_h = direction < 0
	
	if die:
		animated_sprite_2d.play("fly")
	else:
		animated_sprite_2d.play("fly")

	move_and_slide()

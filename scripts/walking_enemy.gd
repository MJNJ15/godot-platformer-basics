extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var speed := 100
@export var patrol_time := 2
@export var direction := 1

const JUMP_VELOCITY = -400.0
var wait_time := 1
var timer = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity = get_gravity() * delta
		
	animated_sprite_2d.play("walk")
	
	timer += delta
	if timer >= patrol_time:
		velocity.x = 0
		if timer >= patrol_time + wait_time:
			timer = 0
			direction *= -1
	
	velocity.x = speed * direction
	animated_sprite_2d.flip_h = direction < 0

	move_and_slide()

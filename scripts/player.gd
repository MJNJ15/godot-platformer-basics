extends CharacterBody2D

@onready var player_sprite: AnimatedSprite2D = $player_sprite
@onready var player_collision: CollisionShape2D = $player_collision
@onready var level_manager: Node2D = $".."

signal player_died

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

var hp: int
var is_pause

func _ready() -> void:
	hp = 1
	is_pause = -1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if is_pause < 0:
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		var direction := Input.get_axis("move_left", "move_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		# Animation
		if is_on_floor():
			if direction == 0:
				player_sprite.play("idle")
			else:
				player_sprite.play("walk")
				if direction > 0:
					player_sprite.flip_h = false
				else:
					player_sprite.flip_h = true
		else :
			if velocity.y < 0:
				player_sprite.play("jump")
			else:
				player_sprite.play("fall")
	
	move_and_slide()

func get_hit():
	hp -= 1
	if hp <= 0:
		die()

func die():
	is_pause *= -1
	velocity.x = 0
	player_died.emit()
	player_collision.queue_free()
	player_sprite.play("fall")

func _on_game_paused():
	is_pause = -1

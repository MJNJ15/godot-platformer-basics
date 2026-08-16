extends AnimatableBody2D

@export var move_to := Vector2(200, 0)
@export var duration := 2.0
@export var wait_time := 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var start = position
	var end = position + move_to
	
	var tween := create_tween()
	tween.set_loops()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)

	tween.tween_interval(wait_time)
	tween.tween_property(self, "position", end, duration) \
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

	tween.tween_interval(wait_time)
	tween.tween_property(self, "position", start, duration) \
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass

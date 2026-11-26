extends Label

func _ready() -> void:
	pass # Replace with function body.

func update_apple_score(score: int) -> void:
	text = "Apple: " + str(score)

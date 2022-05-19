extends Area2D

export var speed := 100  # How fast the ball will move (pixels/sec).
var direction := Vector2.ZERO
var start_pos := position


func reset() -> void:
	direction = Vector2.ZERO
	position = start_pos


func _process(delta) -> void:
	position += direction * speed * delta


func _on_Main_round_started() -> void:
	randomize()

	var left_or_right := -PI / 2 if randi() % 2 else PI / 2
	direction = Vector2.UP.rotated(rand_range(-PI / 4, PI / 4) + left_or_right)

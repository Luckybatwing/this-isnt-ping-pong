extends KinematicBody2D

export var speed := 100  # Speed (pixels/sec)
var direction := Vector2.ZERO  # Direction the ball is moving
var start_pos := position  # Starting position


# Reset to starting position and stop movement
func reset() -> void:
	direction = Vector2.ZERO
	position = start_pos


func _physics_process(delta: float) -> void:
	var collision := move_and_collide(direction * speed * delta)

	if collision:
		direction = direction.bounce(collision.normal)


# Set a random direction
func _on_Main_round_started() -> void:
	randomize()

	var left_or_right := -PI / 2 if randi() % 2 else PI / 2
	direction = Vector2.UP.rotated(rand_range(-PI / 4, PI / 4) + left_or_right)

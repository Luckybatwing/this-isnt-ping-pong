extends KinematicBody2D

export var starting_speed := 250.0  # pixels/sec
export var speed_increase := 10.0  # pixels/sec
var speed := starting_speed
var direction := Vector2.ZERO  # Direction the ball is moving
var start_pos := position  # Starting position


# Reset to starting position and stop movement
func reset() -> void:
	direction = Vector2.ZERO
	position = start_pos
	speed = starting_speed


func _physics_process(delta: float) -> void:
	speed += speed_increase * delta

	var collision := move_and_collide(direction * speed * delta)
	if collision:
		direction = direction.bounce(collision.normal)


# Set a random direction
func _on_Main_round_started() -> void:
	randomize()

	var left_or_right := -PI / 2 if randi() % 2 else PI / 2
	direction = Vector2.UP.rotated(rand_range(-PI / 4, PI / 4) + left_or_right)

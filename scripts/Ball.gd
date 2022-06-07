extends KinematicBody2D

export var starting_speed := 250.0  # pixels/sec
export var speed_increase := 10.0  # pixels/sec
onready var speed := starting_speed
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
		if collision.collider is StaticBody2D:
			direction = direction.bounce(collision.normal)
		elif collision.normal.abs() != Vector2.DOWN:
			# collision.collider is KinematicBody2D
			randomize()
			direction = collision.normal.rotated(rand_range(-PI / 3, PI / 3))


# Set a random direction
func _on_Main_round_started() -> void:
	randomize()

	var left_or_right := -PI / 2 if randi() % 2 else PI / 2
	direction = Vector2.UP.rotated(rand_range(-PI / 4, PI / 4) + left_or_right)

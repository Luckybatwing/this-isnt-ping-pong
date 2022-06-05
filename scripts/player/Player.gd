extends KinematicBody2D

const Ball := preload("res://scripts/Ball.gd")

export var acceleration := 40.0  # pixels/sec
export var starting_max_velocity := 400.0  # pixels/sec
export var max_velocity_increase := 5.0  # pixels/sec
var max_velocity := starting_max_velocity
var velocity := Vector2.ZERO
var start_pos := position  # Starting position


# Returns a direction(2D vector) from input
func read_input():
	assert(false, "Method not overridden")


func _physics_process(delta: float) -> void:
	max_velocity += max_velocity_increase * delta

	var direction: Vector2 = read_input()
	if direction:
		velocity += direction * acceleration
		velocity = velocity.clamped(max_velocity)
	else:
		velocity = velocity.linear_interpolate(Vector2.ZERO, 0.15)

	var collision := move_and_collide(velocity * delta)

	if collision:
		if collision.collider is StaticBody2D:
			velocity = velocity.rotated(PI) * 0.5
		elif collision.collider is Ball and (collision.normal.abs() == Vector2.DOWN):
			var ball := collision.collider as Ball

			# ball.speed = 10
			# ball.speed_increase = 0
			# ball.direction = Vector2.LEFT

			var ball_collision := ball.move_and_collide(velocity * delta)

			move_and_collide(collision.remainder)

			if ball_collision:
				print_debug(ball_collision.collider)


# Reflect ball on collision
func _on_Player_area_entered(area: Area2D) -> void:
	area.direction = area.direction.reflect(Vector2.UP)


# Reset to starting position
func reset() -> void:
	position = start_pos
	velocity = Vector2.ZERO
	max_velocity = starting_max_velocity

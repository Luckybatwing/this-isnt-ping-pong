extends KinematicBody2D

export var acceleration := 40.0  # pixels/sec
export var starting_max_velocity := 400.0  # pixels/sec
export var max_velocity_increase := 5.0  # pixels/sec
onready var max_velocity := starting_max_velocity
var velocity := 0.0
var start_pos := position  # Starting position


# Returns a direction(2D vector) from input
func read_input():
	assert(false, "Method not overridden")


func _physics_process(delta: float) -> void:
	max_velocity += max_velocity_increase * delta

	var direction: float = read_input()
	if direction:
		velocity += direction * acceleration
		velocity = clamp(velocity, -max_velocity, max_velocity)
	else:
		velocity = lerp(velocity, 0.0, 0.15)

	var collision := move_and_collide(Vector2(0.0, velocity * delta))
	if collision and collision.collider is StaticBody2D:
		velocity = -velocity * 0.5


# Reflect ball on collision
func _on_Player_area_entered(area: Area2D) -> void:
	area.direction = area.direction.reflect(Vector2.UP)


# Reset to starting position
func reset() -> void:
	position = start_pos
	velocity = 0.0
	max_velocity = starting_max_velocity

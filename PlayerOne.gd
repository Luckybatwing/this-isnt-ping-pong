extends "res://Player.gd"


func read_input() -> Vector2:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_up_p1"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down_p1"):
		velocity.y += 1

	return velocity

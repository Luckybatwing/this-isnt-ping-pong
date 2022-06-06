extends "res://scripts/player/Player.gd"


func read_input() -> float:
	if Input.is_action_pressed("move_up_p1"):
		return -1.0
	if Input.is_action_pressed("move_down_p1"):
		return 1.0
	return 0.0

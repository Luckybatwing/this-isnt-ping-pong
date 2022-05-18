extends Area2D

export var speed := 100  # How fast the ball will move (pixels/sec).
var direction := Vector2.ZERO
var start_pos := position


func reset():
	direction = Vector2.ZERO
	position = start_pos


func _process(delta):
	position += direction * speed * delta


func _on_Main_round_started():
	randomize()

	var dir = [-PI / 2, PI / 2]
	direction = Vector2.UP.rotated(rand_range(-PI / 4, PI / 4) + dir[randi() % 2])

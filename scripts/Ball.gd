extends Area2D

export var speed := 100  # How fast the ball will move (pixels/sec).
var direction: Vector2
var start_pos := position


func reset():
	randomize()

	var dir = [-PI / 2, PI / 2]
	direction = Vector2.UP.rotated(rand_range(-PI / 4, PI / 4) + dir[randi() % 2])

	position = start_pos


func _ready():
	reset()


func _process(delta):
	position += direction * speed * delta

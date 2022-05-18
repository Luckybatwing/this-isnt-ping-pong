extends Area2D

export var speed := 100  # How fast the ball will move (pixels/sec).
var direction: Vector2


func _ready():
	var dir = [-PI / 2, PI / 2]
	randomize()

	direction = Vector2.UP.rotated(rand_range(-PI / 4, PI / 4) + dir[randi() % 2])


func _process(delta):
	position += direction * speed * delta

extends Area2D

export var speed = 400  # How fast the player will move (pixels/sec).
var screen_size: Vector2  # Size of the game window.


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO

	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1

	velocity *= speed

	position += velocity * delta
	position.y = clamp(position.y, 0, screen_size.y - $Paddle.polygon[2].y)


func _on_Player_area_entered(area: Area2D):
	area.direction = area.direction.reflect(Vector2.UP)

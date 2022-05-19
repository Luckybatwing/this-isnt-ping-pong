extends Area2D

export var speed := 400  # How fast the player will move (pixels/sec).
var screen_size: Vector2  # Size of the game window.
var start_pos := position


func _ready() -> void:
	screen_size = get_viewport_rect().size


func read_input():
	assert(false, "Method not overridden")


func _process(delta: float) -> void:
	var direction: Vector2 = read_input()

	position += direction * speed * delta

	position.y = clamp(
		position.y, $Paddle.polygon[2].y / 2, screen_size.y - ($Paddle.polygon[2].y / 2)
	)


func _on_Player_area_entered(area: Area2D) -> void:
	area.direction = area.direction.reflect(Vector2.UP)


func reset() -> void:
	position = start_pos

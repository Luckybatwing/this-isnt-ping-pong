extends Area2D


func _on_Goal_area_entered(area: Area2D):
	area.direction = area.direction.reflect(Vector2.UP)

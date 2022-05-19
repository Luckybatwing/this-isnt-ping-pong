extends Area2D


# Reflect ball on collision
func _on_Barrier_area_entered(area: Area2D) -> void:
	area.direction = area.direction.reflect(Vector2.RIGHT)

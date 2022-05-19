extends Area2D


func _on_Barrier_area_entered(area: Area2D) -> void:
	area.direction = area.direction.reflect(Vector2.RIGHT)

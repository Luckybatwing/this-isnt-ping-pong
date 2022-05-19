extends Node


func _on_Button_pressed() -> void:
	var err := get_tree().change_scene("res://scenes/Main.tscn")
	assert(err == OK, "Failed to switch scenes")

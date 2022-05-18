extends Node


func _on_Button_pressed():
	assert(get_tree().change_scene("res://scenes/Main.tscn") == OK, "Failed to switch scenes")

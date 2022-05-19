extends Node

signal round_started

var player_one_score := 0
var player_two_score := 0


func game_end(player: int) -> void:
	$HUD/Message.show()

	match player:
		1:
			$HUD/Message.text = "Player 1 wins!"
		2:
			$HUD/Message.text = "Player 2 wins!"

	yield(get_tree().create_timer(1.5), "timeout")

	$MainMenuButton.show()


func _on_Button_pressed() -> void:
	var err := get_tree().change_scene("res://scenes/MainMenu.tscn")
	assert(err == OK, "Failed to switch scenes")


func increment_player_score(player: int) -> void:
	match player:
		1:
			player_one_score += 1
			$HUD/PlayerOneScore.text = str(player_one_score)
		2:
			player_two_score += 1
			$HUD/PlayerTwoScore.text = str(player_two_score)


func round_start() -> void:
	get_tree().call_group("bodies", "reset")

	$HUD/Message.show()
	$HUD/MessageTimer.start(0.667)

	$HUD/Message.text = "Ready?"
	yield($HUD/MessageTimer, "timeout")
	$HUD/Message.text = "Set."
	yield($HUD/MessageTimer, "timeout")
	$HUD/Message.text = "Go!"
	yield($HUD/MessageTimer, "timeout")

	$HUD/Message.hide()
	$HUD/MessageTimer.stop()

	emit_signal("round_started")


func _ready() -> void:
	round_start()


func on_goal(player: int) -> void:
	increment_player_score(player)
	if player_one_score == 3:
		game_end(1)
	elif player_two_score == 3:
		game_end(2)
	else:
		$HUD/Message.show()
		$HUD/MessageTimer.start(2)

		match player:
			1:
				$HUD/Message.text = "Player 1 scores!"
			2:
				$HUD/Message.text = "Player 2 scores!"
		yield($HUD/MessageTimer, "timeout")

		$HUD/Message.hide()
		$HUD/MessageTimer.stop()

		round_start()


func _on_GoalLeft_area_entered(_area: Area2D) -> void:
	on_goal(2)


func _on_GoalRight_area_entered(_area: Area2D) -> void:
	on_goal(1)

extends Node

var player_one_score := 0
var player_two_score := 0


func _on_GoalLeft_area_entered(_area: Area2D):
	increment_player_score(1)


func _on_GoalRight_area_entered(_area: Area2D):
	increment_player_score(2)


func increment_player_score(player: int):
	match player:
		1:
			player_one_score += 1
			$HUD/PlayerOneScore.text = str(player_one_score)
		2:
			player_two_score += 1
			$HUD/PlayerTwoScore.text = str(player_two_score)
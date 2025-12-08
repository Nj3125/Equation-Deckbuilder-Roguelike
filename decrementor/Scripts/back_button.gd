extends Button


func _on_pressed_leaderboard():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
func _on_pressed_defeat():
	GameState.current_level = 1
	GameState.player_health = 100
	GameState.enemy_health = 50
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

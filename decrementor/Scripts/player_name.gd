extends Control

@onready var line_edit: LineEdit = $LineEdit

func _on_submit_pressed() -> void:
	Global.playerName = line_edit.text
	var sw_result : Dictionary = await SilentWolf.Scores.save_score(Global.playerName, Global.score).sw_save_score_complete
	print("Score persisted successfully: " + str(sw_result.score_id))
	self.hide()

extends Button



func _on_retrybutton_button_up():
	Playerdata.score=0
	get_tree().paused = false
	get_tree().reload_current_scene()

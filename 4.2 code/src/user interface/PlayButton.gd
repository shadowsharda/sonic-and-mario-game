@tool
extends Button

@export var next_scene_path ="" # (String,FILE)

func _on_PlayButton_button_up():
	Playerdata.reset()
	get_tree().change_scene_to_file(next_scene_path)
func _get_configuration_warnings()->PackedStringArray:
	if next_scene_path==[]:
		return ["next scene path is empty"]
	else:
		return []

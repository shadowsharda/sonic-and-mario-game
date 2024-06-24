@tool
extends Area2D
@onready var anim_player :AnimationPlayer = $AnimationPlayer
@export var next_scene :PackedScene
func _get_configuration_warnings() ->PackedStringArray:
	if not next_scene:
		return ["the next scene is empty"]
	else:
		return []
func teleport():
	anim_player.play("start (copy)")
	#await anim_player.animation_finished
	


func _on_body_entered(_body):
	teleport()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name=="start (copy)":
		get_tree().change_scene_to_packed(next_scene)

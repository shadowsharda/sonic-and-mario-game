extends Area2D
@export var coinpoint :int = 100

@onready var anim_player :AnimationPlayer = $AnimationPlayer


func _on_body_entered(_body):
	Playerdata.score = Playerdata.score +coinpoint
	anim_player.play("fade_out")

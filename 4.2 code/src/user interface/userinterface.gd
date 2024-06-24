extends Control
@onready var scene_tree := get_tree()
@onready var pause_menu :ColorRect =$ColorRect
@onready var score :Label = $scoreLabel

var paused :bool =false: set = set_paused

func _unhandled_input(_event):
	if Input.is_action_pressed("pause"):
		self.paused = true
		scene_tree.set_input_as_handled()
func set_paused(value:bool)->void:
	paused =value
	scene_tree.paused = value
	pause_menu.visible = value
func update_interface() ->void:
	score.text = str(Playerdata.score)

func _on_resumebuton_button_up():
	self.paused = false
func playerzero()->void:
	$ColorRect/Label.text =str("Eliminated")
	self.paused = true
	$ColorRect/pausevboxcontainer/resumebuton.visible =false
func _ready():
	Playerdata.connect("updated", Callable(self, "update_interface"))
	
	Playerdata.connect("player_died", Callable(self, "playerzero"))

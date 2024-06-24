extends "res://src/actors/actor.gd"
func _ready():
	set_physics_process(false)
	_velocity.x = -speed.x

func _on_stompdectectorArea2D_body_entered(_body):
	$CollisionShape2D.set_deferred("disabled",true)
	queue_free()
	
func _physics_process(delta):
	#print_debug("running_physics")
	_velocity.y = _velocity.y+(gravity*delta)
	if is_on_wall():
		_velocity.x = _velocity.x* -1.0
	set_velocity(_velocity)
	set_up_direction(Vector2(0,-1))
	move_and_slide()
	_velocity.y = velocity.y



func _on_visible_on_screen_enabler_2d_screen_entered() -> void:
	set_physics_process(true)

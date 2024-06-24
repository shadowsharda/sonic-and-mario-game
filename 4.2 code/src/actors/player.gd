extends actor
var canjump :bool = false
@export var stomp_impulse:float= 1000.0
func _on_enemydectorArea2D_area_entered(area):
	var direction :Vector2=Vector2(0,-0.3)
	_velocity = calculate_stomp_velocity(_velocity,direction,speed)
	set_velocity(_velocity)
	move_and_slide()
func _on_enemydectorArea2D_body_entered(body):
	Playerdata.deaths =Playerdata.deaths+1
	queue_free()
func _physics_process(delta):
	var direction = get_direction()
	_velocity = calculate_move_velocity(_velocity,direction,speed,delta)
	set_velocity(_velocity)
	set_up_direction(Vector2(0,-1))
	move_and_slide()
	_velocity =velocity
func get_direction() -> Vector2:
	var new_direction=Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),0.5)
	if Input.is_action_just_pressed("jump")&&is_on_floor() :
		new_direction.y =0
		$Timer.start()
		canjump = true
	if Input.is_action_just_released("jump")&&Input.is_action_just_pressed("boost_jump"):
		canjump =true
	if canjump== true:
		new_direction.y =-1
	return new_direction
func calculate_move_velocity(linear_velocity:Vector2,speed:Vector2,direction:Vector2,delta) ->Vector2:
	var new_velocity =linear_velocity
	new_velocity.x = speed.x * direction.x*get_physics_process_delta_time()
	new_velocity.y =speed.x*direction.y*get_physics_process_delta_time()
	if direction.y >=-1.50:
		new_velocity.y= speed.y* direction.y*get_physics_process_delta_time()
	return new_velocity
func calculate_stomp_velocity(linear_velocity:Vector2, impulse:Vector2,speed1:Vector2) ->Vector2:
	var out: =linear_velocity
	out.y= speed1.y*impulse.y
	return out
#this function will help to jump.
#the amount of time spend in air is controled by this function
func _on_Timer_timeout():
	canjump = false
	$Timer.stop()
	#$Timer.connect("timeout",self,"get_direction")









	

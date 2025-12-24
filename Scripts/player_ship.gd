extends Ship

func _process(delta):
	thrust = Input.get_action_strength("thrust")
	
	rotation_input = (
		Input.get_action_strength("rotate_left") 
		- Input.get_action_strength("rotate_right"))
	
	if Input.is_action_pressed("shoot"):
		shoot_requested = true
		

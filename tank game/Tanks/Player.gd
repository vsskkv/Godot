extends "res://Tanks/Tank.gd"

# fucntion here: 
# changes the position of the turret to face the mouse
# rotates the body by which key is pressed 
# - can be left or right
# 
func control(delta):
	
	$turret.look_at(get_global_mouse_position())
	var rot_dir = 0
	
	if Input.is_action_pressed("ui_right"):
		rot_dir += 1
	if Input.is_action_pressed("ui_left"):
		rot_dir -= 1
	rotation += rotaion_speed *rot_dir * delta
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(Speed, 0).rotated(rotation)
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2(-Speed/2, 0).rotated(rotation)
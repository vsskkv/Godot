extends "res://Tanks/Tank.gd"

onready var parent = get_parent()

export (float) var turret_speed
export (int) var detect_radius

var target = null

func _ready():
	$DetectRaduis/CollisionShape2D.shape.radius = detect_radius

func control(delta):
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + Speed * delta)
		position = Vector2()
	else:
		pass

func _process(delta):
	if target:
		var target_dir = (target.global_position - global_position).normalized()
		var current_dir = Vector2(1, 0).rotated($turret.global_rotation)
		$turret.global_rotation = current_dir.linear_interpolate(target_dir, turret_speed * delta).angle()

func _on_DetectRaduis_body_entered(body):
	if body.name == "player":
		target = body


func _on_DetectRaduis_body_exited(body):
	if body == target:
		target = null

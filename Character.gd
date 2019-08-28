extends Sprite

signal mouse_hover_changed
var mouse_hover = false
var mouse_pressed = false

signal angle_changed

# debug variable
var draw_axis = false

	
func _input(event):
	if event is InputEventMouseMotion:
		# Calculate the vector from the character to the current mouse position
		var directionToMouse: Vector2 = get_local_mouse_position()
		# var directionToMouse: Vector2 = get_local_mouse_position() - global_position
		# Set the angle (in radians)
		rotate(directionToMouse.angle())
		# Shorter alternative in Godot:	
		# rotation = get_global_mouse_position().angle_to_point(global_position)
		# clamp the rotation
		if abs(rotation / (2 * PI)) > 1:
			if rotation > 0:
				rotation = rotation - (2*PI)
			else:
				rotation = rotation + (2*PI)
		# send value to the GUI
		emit_signal("angle_changed", rotation)
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_lmb"):
			mouse_pressed = true
		elif event.is_action_released("mouse_lmb"):
			mouse_pressed = false
	# request the node a re-draw (calls the _draw() method)
	update()

func _draw():
	if mouse_pressed:
		print(get_local_mouse_position().ceil().y)
		draw_line(Vector2(), get_local_mouse_position(), Color.blue)
	
	if draw_axis:
		draw_line(Vector2(), Vector2(500, 0), Color.red)
		draw_line(Vector2(), Vector2(0, 500), Color.green)


func _on_Area2D_mouse_entered():
	$AnimationPlayer.play("squash")
	$AnimationPlayer.queue("squash-loop")
	mouse_hover = true

func _on_Area2D_mouse_exited():
	$AnimationPlayer.play("squash-out")
	mouse_hover = false

extends Sprite

signal mouse_hover_changed
var mouse_hover = false setget set_mouse_hover
var mouse_pressed = false

signal angle_changed

func set_mouse_hover(val):
	mouse_hover = val
	emit_signal("mouse_hover_changed", val)

func set_angle(val):
	"""val in rads"""
	rotation = val
	emit_signal("angle_changed", rotation)
	
func _on_Area2D_mouse_entered():
	set_mouse_hover(true)
	$AnimationPlayer.play("squash")
	$AnimationPlayer.queue("squash-loop")

func _on_Area2D_mouse_exited():
	set_mouse_hover(false)
	$AnimationPlayer.play("squash-out")
	
func _input(event):
	if event is InputEventMouseMotion:
		var arotation = get_global_mouse_position().angle_to_point(global_position)
		set_angle(arotation)
		
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_lmb"):
			print("Mouse sinistro premuto")
			mouse_pressed = true
		elif event.is_action_released("mouse_lmb"):
			print("Mouse sinistro rilasciato")
			mouse_pressed = false
		if event.is_action_pressed("mouse_rmb"):
			mouse_pressed = true
			print("Mouse destro premuto")
		elif event.is_action_released("mouse_rmb"):
			print("Mouse destro rilasciato")
			mouse_pressed = false
	update()

func _draw():
	if mouse_pressed:
		draw_line(Vector2(), get_local_mouse_position(), Color.white)

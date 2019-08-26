extends Sprite

signal mouse_hover_changed
var mouse_hover = false
var mouse_pressed = false

signal angle_changed

func set_mouse_hover(val):
	mouse_hover = val
	emit_signal("mouse_hover_changed", val)

func set_angle(val):
	"""val in rads"""
	rotation = val
	emit_signal("angle_changed", rotation)
	
func _input(event):
	pass
	# request the node a re-draw (calls the _draw() method)
	update()

func _draw():
	pass

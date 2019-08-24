extends Sprite

var mouse_hover = false

func _on_Area2D_mouse_entered():
	print("MOUSE")
	mouse_hover = true

func _on_Area2D_mouse_exited():
	mouse_hover = false
	
func _process(delta):
	print(mouse_hover)

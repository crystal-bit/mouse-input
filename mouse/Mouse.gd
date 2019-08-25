extends Node2D


func _input(event):
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_lmb"):
			$"iconmonstr-mouse-lmb".show()
		elif event.is_action_released("mouse_lmb"):
			$"iconmonstr-mouse-lmb".hide()
		
		if event.is_action_pressed("mouse_rmb"):
			$"iconmonstr-mouse-rmb".show()
			return
		elif event.is_action_released("mouse_rmb"):
			$"iconmonstr-mouse-rmb".hide()
		
		
		
extends CanvasLayer

export(NodePath) var characterPath
onready var character: Sprite = get_node(characterPath)

func _input(event):
	if event is InputEventMouseMotion:
		$HBoxContainer/Value.text = str(event.position.ceil())  # event.position contains the global mouse position
		$HBoxContainer2/Value.text = str(character.get_local_mouse_position().ceil())

func _on_Character_angle_changed(new_angle):
	$HBoxContainer3/Value.text = str(ceil(rad2deg(new_angle))) + "°"
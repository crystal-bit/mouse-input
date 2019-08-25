extends CanvasLayer

export(NodePath) var characterPath
onready var character: Sprite = get_node(characterPath)

func _input(event):
	if event is InputEventMouseMotion:
		$HBoxContainer/Value.text = str(event.position)
		# NOTE: you have to rotate the local position, otherwise you will get strange values that are
		# relative to the rotate position
		$HBoxContainer2/Value.text = str(character.get_local_mouse_position().rotated(character.rotation).ceil())

func _on_Character_angle_changed(new_angle):
	$HBoxContainer3/Value.text = str(ceil(rad2deg(new_angle))) + "°"
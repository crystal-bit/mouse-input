extends Node2D

export(NodePath) var characterPath
onready var character: Sprite = get_node(characterPath)

export(bool) var draw_angle = false


func _input(event):
	update()

func _draw():
	if draw_angle:
		var color
		if character.rotation > 0:
			color = Color.green
		else:
			color = Color.red
		draw_line(character.position, character.position + Vector2(250, 0), color)
		draw_circle_arc_poly(character.position, 40, 90, 90 + character.rotation_degrees, color)


func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
    var nb_points = 32
    var points_arc = PoolVector2Array()
    points_arc.push_back(center)
    var colors = PoolColorArray([color])

    for i in range(nb_points + 1):
        var angle_point = deg2rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
        points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
    draw_polygon(points_arc, colors)

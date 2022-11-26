extends Area2D


const SPEED_AIM = 8

export var path_target: NodePath

onready var target = get_node_or_null(path_target)
onready var upper_vi = $VisualInstance/Upper


func _process(delta):
	var angle = get_angle_to(target.global_position)
	# print(angle)

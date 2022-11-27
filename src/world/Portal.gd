extends Area2D


export var path_exit_portal: NodePath

onready var exit_portal = get_node(path_exit_portal)
onready var sound_teleport = $Sound/Teleport

var ignored_names = {}


func _on_Portal_body_entered(body):
	if ignored_names.has(body.name): return
	
	var offset = global_position - body.global_position
	body.global_position = exit_portal.global_position - offset
	
	exit_portal.ignore_until_exit(body.name)
	sound_teleport.play()


func ignore_until_exit(body_name):
	ignored_names[body_name] = true


func _on_Portal_body_exited(body):
	if ignored_names.has(body.name):
		ignored_names.erase(body.name)

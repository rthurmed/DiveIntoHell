extends Area2D


export var speed = 140


func _physics_process(delta):
	position += Vector2.LEFT.rotated(rotation) * speed * delta


func _on_Timer_timeout():
	# TODO: death animation?
	queue_free()


func _on_Arrow_body_entered(body):
	if body.has_method('damage'):
		body.damage()
		queue_free()
		return
	
	# bounce of walls and obstacles
	# TODO
	queue_free()
	

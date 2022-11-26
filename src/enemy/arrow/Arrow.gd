extends KinematicBody2D


export var speed = 140
export var speed_reflect_mutator = 1.15
export var speed_mutation_min = 40
export var speed_mutation_max = 300


func _physics_process(delta):
	var movement = Vector2.LEFT.rotated(rotation) * speed
	var collision = move_and_collide(movement * delta)
	collide(collision, delta)


func collide(collision: KinematicCollision2D, _delta):
	if not collision:
		return
	
	var body: Node = collision.collider
	if body.has_method('damage'):
		cause_damage(body)
		return
	
	reflect(collision.normal)


func cause_damage(body):
	body.damage()
	queue_free()


func reflect(normal):
	rotation = Vector2.LEFT.rotated(rotation).reflect(normal).angle()
	speed = speed * speed_reflect_mutator
	speed = clamp(speed, speed_mutation_min, speed_mutation_max)


func _on_Timer_timeout():
	# TODO: death animation?
	queue_free()

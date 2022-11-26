extends State


onready var timer = $Timer
onready var aim_raycast: RayCast2D = $"%AimRayCast"


func process(delta: float):
	owner.aim_to_target(delta)


func physics_process(_delta: float):
	if (
		aim_raycast.is_colliding() and
		aim_raycast.get_collider().name == owner.target.name
	):
		transition('Shoot')


func enter():
	timer.start()


func _on_Timer_timeout():
	if not active(): return
	transition('Shoot')

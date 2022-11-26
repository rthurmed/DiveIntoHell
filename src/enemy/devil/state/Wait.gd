extends State


onready var timer = $Timer

# TODO: MAYBE wait until the arrow hits or dies


func process(delta: float):
	owner.aim_to_target(delta)


func enter():
	owner.aim_visual.visible = false
	timer.start()
	pass


func _on_Timer_timeout():
	if not active(): return
	transition('Prepare')

extends State


onready var timer = $Timer


func enter():
	timer.start()
	pass


func _on_Timer_timeout():
	if not active(): return
	transition('Prepare')

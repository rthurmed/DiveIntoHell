extends State


onready var dash_recovery_timer: Timer = $"%DashRecoveryTimer"


func process(delta: float):
	owner.apply_movement(delta, owner.capture_movement_input())
	
	# TODO: recovery time from dashing, to prevent spaming
	if Input.is_action_just_pressed("player_dash") and owner.has_any_movement_input() and dash_recovery_timer.time_left <= 0:
		transition('Dash')


func exit():
	owner.movement = Vector2.ZERO

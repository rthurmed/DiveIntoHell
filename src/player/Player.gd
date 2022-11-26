extends KinematicBody2D


# TODO: use a state machine

const MOVEMENT_SPEED = 140
const MOVEMENT_ACCEL = 7 # the lower the more slippery

var movement = Vector2.ZERO


func _process(delta):
	var movement_input = Vector2(
		Input.get_action_strength("player_right") - Input.get_action_strength("player_left"),
		Input.get_action_strength("player_down") - Input.get_action_strength("player_up")
	)
	
	movement_input = movement_input.normalized()
	
	movement = lerp(movement, movement_input, delta * MOVEMENT_ACCEL)
	var _slide = move_and_slide(movement * MOVEMENT_SPEED)

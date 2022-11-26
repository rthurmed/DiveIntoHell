extends KinematicBody2D


const MOVEMENT_SPEED = 140
const MOVEMENT_ACCEL = 7 # the lower the more slippery
const LIFE_DEFAULT_DAMAGE = 1

export var life_max = 4

onready var state_machine = $StateMachine

var movement = Vector2.ZERO
var life = life_max


func capture_movement_input():
	var movement_input = Vector2(
		Input.get_action_strength("player_right") - Input.get_action_strength("player_left"),
		Input.get_action_strength("player_down") - Input.get_action_strength("player_up")
	)
	movement_input = movement_input.normalized()
	return movement_input


func apply_movement(delta, movement_input, speed = MOVEMENT_SPEED, accel = MOVEMENT_ACCEL):
	movement = lerp(movement, movement_input, delta * accel)
	var _slide = move_and_slide(movement * speed)


func damage():
	life -= LIFE_DEFAULT_DAMAGE
	state_machine.transition('SufferHit')

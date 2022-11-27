extends KinematicBody2D


const MOVEMENT_SPEED = 140
const MOVEMENT_ACCEL = 7 # the lower the more slippery
const LIFE_DEFAULT_DAMAGE = 1

export var life_max = 3
export var objective = 'Kill all enemies'

onready var state_machine = $StateMachine
onready var animation = $AnimationPlayer
onready var objective_label = $CanvasLayer/UI/ObjectiveLabel

var movement = Vector2.ZERO
var life = life_max

# warning-ignore:unused_signal
signal death


func _ready():
	objective_label.text = objective


func capture_movement_input():
	var movement_input = Vector2(
		Input.get_action_strength("player_right") - Input.get_action_strength("player_left"),
		Input.get_action_strength("player_down") - Input.get_action_strength("player_up")
	)
	movement_input = movement_input.normalized()
	return movement_input


func has_any_movement_input():
	return (
		Input.is_action_pressed("player_right") or
		Input.is_action_pressed("player_left") or
		Input.is_action_pressed("player_down") or
		Input.is_action_pressed("player_up")
	)


func apply_movement(delta, movement_input, speed = MOVEMENT_SPEED, accel = MOVEMENT_ACCEL):
	movement = lerp(movement, movement_input, delta * accel)
	var _slide = move_and_slide(movement * speed)


func damage():
	life -= LIFE_DEFAULT_DAMAGE
	state_machine.transition('SufferHit')

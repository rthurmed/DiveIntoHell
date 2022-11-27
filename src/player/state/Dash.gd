extends State


const ANIMATION_NAME = 'dash'
const ANIMATION_SPEED = 2
const MOVEMENT_ACCEL = 10

export var speed = 400

var direction = Vector2.ZERO


func process(delta: float):
	owner.apply_movement(delta, direction, speed, MOVEMENT_ACCEL)


func enter():
	direction = owner.capture_movement_input()
	owner.animation.play(ANIMATION_NAME, -1, ANIMATION_SPEED)


func exit():
	owner.movement = Vector2.ZERO


func _on_AnimationPlayer_animation_finished(anim_name):
	if not active() or not anim_name == ANIMATION_NAME:
		return
	transition('Walk')

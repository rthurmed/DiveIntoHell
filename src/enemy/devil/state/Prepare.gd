extends State


const ANIMATION_NAME = 'prepare'
const ANIMATION_CUSTOM_SPEED = .5

export var custom_aim_speed = 10


func process(delta: float):
	owner.aim_to_target(delta, custom_aim_speed)


func enter():
	owner.target = owner.original_target
	owner.animation.play(ANIMATION_NAME, -1, ANIMATION_CUSTOM_SPEED)


func exit():
	owner.animation.stop(true)


func _on_AnimationPlayer_animation_finished(anim_name):
	if (
		not active() or
		not anim_name == ANIMATION_NAME
	):
		return
	
	transition('Aim')
	
	

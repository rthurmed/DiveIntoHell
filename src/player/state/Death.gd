extends State


const ANIMATION_NAME = 'death'


func enter():
	owner.animation.play(ANIMATION_NAME)


func _on_AnimationPlayer_animation_finished(anim_name):
	if not active() or not anim_name == ANIMATION_NAME:
		return
	
	owner.emit_signal('death')
